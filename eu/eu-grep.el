;----------------------------------------------------------------------

;;; Modified ack.el by Philip Jackson <phil@shellarchive.co.uk>, GNU GPL2
;;; Use gr where you might usually use grep.
;;; Commentary:
;; gr.el provides a simple compilation mode for the haskell grep-a-like gr

;----------------------------------------------------------------------

;; (defvar gr-command "grr"
;;   "The command to be run by the gr function.")

(defvar gr-template "/Users/eu/bin/grr <R> <D>")
(defvar gr-template-c "/Users/eu/bin/grr -C <R> <D>")
;; (defvar gr-template "gr <R> <D>")
;; (defvar gr-template-c "gr -c <R> <D>")

;; (defun gr-build-command ()
;;   (concat gr-command " "))

(define-compilation-mode gr-mode "Gr"
  "Gr compilation mode."
  (set (make-local-variable 'compilation-disable-input) t)
  (set (make-local-variable 'compilation-error-face)
       grep-hit-face))

;; handle ansi color sequences
(defvar gr-ansi-colorizing-end (point-min))
(make-variable-buffer-local 'gr-ansi-colorizing-end)

(defun colorize-compilation-buffer ()
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region gr-ansi-colorizing-end (point-max)))
  (setq gr-ansi-colorizing-end (point-max)))

(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;----------------------------------------------------------------------

;; (defun gr-old (command-args)
;;   (interactive
;;    (list (read-from-minibuffer (format "Run gr [%s] (like this): " (file-name-directory (buffer-file-name)))
;;                                (gr-build-command)
;;                                nil
;;                                nil
;;                                'gr-history)))
;;    (compilation-start command-args 'gr-mode))

;----------------------------------------------------------------------

(defun gr (regexp &optional files dir confirm case-insensitive)
  (interactive
   (let* ((regexp (grep-read-regexp))
          (files nil) ;(grep-read-files regexp))
          (dir (read-directory-name "in directory/files: "
                                    nil default-directory nil))
          (confirm (equal current-prefix-arg '(4))))
     (list regexp files dir confirm)))
  (save-some-buffers t)
  (when (and (stringp regexp) (> (length regexp) 0))
    ;; (unless (and dir (file-directory-p dir) (file-readable-p dir))
    ;;   (setq dir default-directory))
    (let ((command regexp)
          (template (if case-insensitive gr-template-c gr-template)))
      ;(setq dir (file-name-as-directory (expand-file-name dir)))
      (setq dir (directory-file-name (expand-file-name dir)))
      (setq command (grep-expand-template
                       template
                       regexp
                       files
                       dir ;(when dir (concat "'" dir "'"))
                       nil))
      (when command
        (if confirm
            (setq command
                  (read-from-minibuffer "Confirm: "
                                        command nil nil 'grep-history))
          (add-to-history 'grep-history command)))
      ;(message command)
      (when command
        (compilation-start command 'gr-mode)
        )
      )))

;----------------------------------------------------------------------

;; (defvar eu-grep-command "-rIPs --exclude-dir='.[a-zA-Z0-9]*' --exclude='*.htm' --exclude='*.html' --exclude='*.pyo' --exclude='*.pyc' --exclude='*.elc' --exclude='*~' --color=always"
;;   "The command to be run by the eu-grep function.")

;; (defvar eu-grep-template "grep <C> <R> <D>")

;; (define-compilation-mode eu-grep-mode "Eu Grep"
;;   "Eu-Grep compilation mode."
;;   (set (make-local-variable 'compilation-disable-input) t)
;;   (set (make-local-variable 'compilation-error-face)
;;        grep-hit-face))

;; (defvar eu-grep-ansi-colorizing-end (point-min))
;; (make-variable-buffer-local 'eu-grep-ansi-colorizing-end)

;; (defun colorize-compilation-buffer ()
;;   (let ((inhibit-read-only t))
;;     (ansi-color-apply-on-region eu-grep-ansi-colorizing-end (point-max)))
;;   (setq eu-grep-ansi-colorizing-end (point-max)))

;; (add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; ;----------------------------------------------------------------------

;; (defun eu-grep (regexp &optional files dir confirm)
;;   (interactive
;;    (let* ((regexp (grep-read-regexp))
;;           (files nil) ;(grep-read-files regexp))
;;           (dir (read-directory-name "in directory/files: "
;;                                     nil default-directory nil))
;;           (confirm (equal current-prefix-arg '(4))))
;;      (list regexp files dir confirm)))
;;   (save-some-buffers t)
;;   (when (and (stringp regexp) (> (length regexp) 0))
;;     ;; (unless (and dir (file-directory-p dir) (file-readable-p dir))
;;     ;;   (setq dir default-directory))
;;     (let ((command regexp))
;;       ;(setq dir (file-name-as-directory (expand-file-name dir)))
;;       (setq dir (expand-file-name dir))
;;       (setq command (grep-expand-template
;;                        eu-grep-template
;;                        regexp
;;                        files
;;                        dir ;(when dir (concat "'" dir "'"))
;;                        nil))
;;       (when command
;;         (if confirm
;;             (setq command
;;                   (read-from-minibuffer "Confirm: "
;;                                         command nil nil 'grep-history))
;;           (add-to-history 'grep-history command)))
;;       ;(message command)
;;       (when command
;;         (compilation-start command 'eu-grep-mode)
;;         )
;;       )))

;----------------------------------------------------------------------

(provide 'eu-grep)

;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
