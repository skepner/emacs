;----------------------------------------------------------------------
; Compilation support
;----------------------------------------------------------------------

;; (add-hook 'compilation-start-hook
;;           (lambda (process) (set-process-query-on-exit-flag process nil)) nil t)

;----------------------------------------------------------------------
; switch to compilation buffer
;----------------------------------------------------------------------

(defun eu-switch-to-compilation-buffer (p)
  (interactive "p")
  (let* ((bname (if (> p 1) (format "*compilation*<%d>" p) "*compilation*"))
         (b (get-buffer bname)))
    (if b (switch-to-buffer b) (progn (beep) (message (format "No buffer %s" bname))))))

;; (global-unset-key "\C-b")
;; (global-set-key "\C-b\C-c" 'eu-switch-to-compilation-buffer)
;; (global-set-key "\C-b\C-m" 'eu-switch-to-makefile)

;----------------------------------------------------------------------

(defun eu-compile ()
  (interactive)
  (if (active-minibuffer-window)
      (previous-history-element 1)
    (call-interactively 'compile)
    ))

(defun eu-compile-no-ask ()
  (interactive)
  (let ((compilation-read-command nil))
    (call-interactively 'compile)))

(setq compilation-ask-about-save nil)

(defun eu-compile-cd-pwd ()
  (interactive)
  (let* ((dir (file-name-directory (buffer-file-name)))
         (stop-dir (substitute-in-file-name "$HOME"))
         (makefile (or (eu-compile-find-makefile "Makefile" dir stop-dir) (eu-compile-find-makefile "\\.cabal$" dir stop-dir) (eu-compile-find-makefile "AA.py" dir stop-dir)))
         (basename (if makefile (file-name-nondirectory makefile) nil))
         (dirname (if makefile (file-name-directory makefile) nil))
         (cmd (cond
               ((not makefile) (concat "cd " dir " && c2 ./" (file-name-nondirectory (buffer-file-name))))
               ((string-match "\\.cabal$" basename) (concat "cd " dirname " && cabal install -j"))
               ((string-match "Makefile" basename) (concat "make -C " dirname " -j -k"))
               ((string-match "\\.py$" basename) (concat "cd " dirname " && c2 ./" basename))
               )))
    (setq compile-command cmd)
    (call-interactively 'compile)))

(defun eu-compile-find-makefile (pattern directory stop-directory)
  (let ((files (directory-files directory t pattern)))
    (if files
        (car files)
      (let ((up-dir (file-name-directory (directory-file-name directory))))
        (if (or (equal up-dir stop-directory) (equal up-dir "/"))
            nil
          (eu-compile-find-makefile pattern up-dir stop-directory))))))

;----------------------------------------------------------------------

;;     (progn
;;       (make-face 'eu-font-lock-error-face)
;;       ;; (set-face-foreground 'eu-font-lock-error-face "yellow")
;;       ;; (set-face-background 'eu-font-lock-error-face "red")
;;       (set-face-foreground 'eu-font-lock-error-face "red")
;;                                         ;(set-face-background 'eu-font-lock-error-face "white")
;;       (if window-system (make-face-bold 'eu-font-lock-error-face))
;;       )

;----------------------------------------------------------------------

;(assq-delete-all 'ada compilation-error-regexp-alist-alist)
;(assq-delete-all 'java compilation-error-regexp-alist-alist)

;; (setq compilation-error-regexp-alist (mapcar 'car compilation-error-regexp-alist-alist))
;; (setq compilation-error-regexp-alist (remove 'java compilation-error-regexp-alist))

;; (setq compilation-mode-font-lock-keywords
;;       '(
;;         ("^[Cc]hecking \\(?:[Ff]or \\|[Ii]f \\|[Ww]hether \\(?:to \\)?\\)?\\(.+\\)\\.\\.\\. *\\(?:(cached) *\\)?\\(\\(yes\\(?: .+\\)?\\)\\|no\\|\\(.*\\)\\)$" (1 font-lock-variable-name-face) (2 font-lock-keyword-face))
;;         ;;("^\\([[:alnum:]_/.+-]+\\)\\(\\[\\([0-9]+\\)\\]\\)?[ \t]*:" (1 font-lock-function-name-face) (3 compilation-line-face nil t))
;;         (" --?o\\(?:utfile\\|utput\\)?[= ]?\\(\\S +\\)" . 1)
;;         ("^Compilation finished.*" . font-lock-keyword-face)
;;         ("^Compilation exited abnormally.*" . font-lock-keyword-face)
;;         ("^[Ii]grep \\(started\\|finished\\).*" . font-lock-keyword-face)
;;         ))

;----------------------------------------------------------------------
; split long lines
;----------------------------------------------------------------------

;; (if (not (boundp 'aquamacs-version))
;;     (progn
;;       (defun eu-compilation-mode-hook ()
;;         (visual-line-mode))
;;       (add-hook 'compilation-mode-hook 'eu-compilation-mode-hook)
;;       ))

;----------------------------------------------------------------------
; bury compilation buffer on success
;----------------------------------------------------------------------

(defun eu-compile-autoclose (command)
  (interactive)
  (compilation-start command nil 'eu-compile-autoclose-name))

(defun eu-compile-autoclose-name (mode)
  "*compilation-autoclose*")

(defun eu-compile-autoclose-finish-hook (buffer string)
  (cond ((and (equal (buffer-name buffer) "*compilation-autoclose*") (not (not (string-match "finished" string))))
         (delete-window (get-buffer-window buffer t))
         ;(bury-buffer "*compilation*")
         (message "Build successful."))))

(add-hook 'compilation-finish-functions 'eu-compile-autoclose-finish-hook)

;----------------------------------------------------------------------
; Shrink compilation window
;----------------------------------------------------------------------

(defun eu-shrink-compilation-window (buffer string)
  (balance-windows)
  (shrink-window-if-larger-than-buffer (get-buffer-window buffer t)))

(add-hook 'compilation-finish-functions 'eu-shrink-compilation-window)

;----------------------------------------------------------------------

(provide 'eu-compile)

;----------------------------------------------------------------------
;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
