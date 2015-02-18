;; ----------------------------------------------------------------------
;; Set frame size

(let* ((b-system-name (string-match "^\\([^\\.]+\\)\\." system-name))
       (e-system-name (match-end 1))
       (hostname (if b-system-name (downcase (substring system-name b-system-name e-system-name))
                   (downcase system-name))))
  (cond
   ((equal hostname "vaat")
    (setq initial-frame-alist (quote ((top . 0) (left . 1) (width . 200) (height . 119)))))
   ((equal hostname "frida")
    (setq initial-frame-alist (quote ((top . 0) (left . 1) (width . 180) (height . 65)))))
   ((equal hostname "jagd")
    (setq initial-frame-alist (quote ((top . 0) (left . 1) (width . 200) (height . 106)))))
   ((equal hostname "andrea")
    (setq initial-frame-alist (quote ((top . 0) (left . 1) (width . 180) (height . 65)))))
   ))

;; ----------------------------------------------------------------------
;; Autosave desktop

(if (not (boundp 'aquamacs-version))
    (progn
      (defun eu-save-desktop ()
        (interactive)
        (desktop-save "~"))  ; must be home dir, other dirs do not work

      (run-at-time "3 min" 600 'eu-save-desktop)
))

;; ----------------------------------------------------------------------

(put 'erase-buffer 'disabled nil)

;; ----------------------------------------------------------------------

(defun byte-compile-this-file ()
  (interactive)
  (byte-compile-file (buffer-file-name))
  )

;; ----------------------------------------------------------------------

(defun eu-occur ()
  (interactive)
  (let ((word (current-word)))
    (add-to-history 'regexp-history word)
    (occur word)))

;; (defun eu-resize-other-window ()
;;   (interactive)
;;   (save-excursion
;;     (other-window 1)
;;     (resize-temp-buffer-window)
;;     (other-window 1)))

(defun eu-occur-error ()
  (interactive)
  (occur "error"))

(defun eu-occur-warning ()
  (interactive)
  (occur "warning"))

;; ----------------------------------------------------------------------

(defun eu-delete-other-window-buffer ()
  "Deletes buffer showed in other window along with that window"
  (interactive)
  (other-window 1)
  (kill-this-buffer)
  (delete-window)
  )

;; ----------------------------------------------------------------------

(defun eu-repeat-complex-command-backward ()
  (interactive)
  (if (active-minibuffer-window)
      (previous-history-element 1)
    (call-interactively 'repeat-complex-command)))

(defun eu-repeat-complex-command-forward ()
  (interactive)
  (if (active-minibuffer-window)
      (next-history-element 1)
    (call-interactively 'repeat-complex-command)))

;; ----------------------------------------------------------------------

(defun eu-copy-sexp (n)
  (interactive "p")
  (let (b e)
    (save-excursion
      (beginning-of-thing 'sexp)
      (mark-sexp n)
      (setq b (region-beginning))
      (setq e (region-end))
      (kill-ring-save b e))
    (pulse-momentary-highlight-region b e)))

(defun eu-copy-line (n)
  (interactive "p")
  (message (format "eu-copy-line %d" n))
  (let (b e)
    (save-excursion
      (forward-line 0)
      (setq b (point))
      (forward-line n)
      (setq e (point))
      (kill-ring-save b e))
    (pulse-momentary-highlight-region b e)))

(defun eu-pulse-current-line ()
  (interactive)
  (let (b e)
    (save-excursion
      (forward-line 0)
      (setq b (point))
      (forward-line 1)
      (setq e (point)))
    (pulse-momentary-highlight-region b e)))

(defun eu-indent-sexp ()
  (interactive)
  (save-excursion
    (mark-sexp)
    ;(pulse-momentary-highlight-region (region-beginning) (region-end))
    (indent-region (region-beginning) (region-end))
    (pulse-momentary-highlight-region (region-beginning) (region-end))))

;; ----------------------------------------------------------------------

(defun eu-find-tag-current-word ()
  (interactive)
  (let ((word (current-word)))
    (add-to-history 'minibuffer-history word)
    (find-tag word)))

;; ----------------------------------------------------------------------

(defun eu-compile-push-history (command)
  (interactive)
  (compile command nil)
  (push command compile-history)
  (delete-dups compile-history))

;; ----------------------------------------------------------------------

(provide 'eu-emacs)

;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
