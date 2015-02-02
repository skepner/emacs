;----------------------------------------------------------------------
; Apache
;----------------------------------------------------------------------

(add-to-list 'auto-mode-alist '("sites\\(-\\(available\\|enabled\\)\\)?/" . apache-mode))
(add-to-list 'auto-mode-alist '("\\(httpd\\|apache2?\\)\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("/apache2/conf\\.d/"  . apache-mode))

;----------------------------------------------------------------------
; tex-mode
;----------------------------------------------------------------------

(defun eu-latex-view ()
  (interactive)
  (save-some-buffers t)
  (eu-compile-autoclose (concat "latex-view " buffer-file-name)))

(defun eu-latex-delimiter ()
  (interactive)
  (beginning-of-line)
  (insert "% ----------------------------------------------------------------------\n"))

(define-key tex-mode-map [f9] 'eu-latex-view)
(define-key tex-mode-map "\M-=" 'eu-latex-delimiter)

;----------------------------------------------------------------------
; Haskell
;----------------------------------------------------------------------

(defun eu-haskell-func-delimiter ()
  (interactive)
  (beginning-of-line)
  (insert "----------------------------------------------------------------------\n"))

(define-key haskell-mode-map "\M-=" 'eu-haskell-func-delimiter)

(defun my-haskell-mode-hook ()
  (local-set-key "\C-cl" 'hs-lint)
  (capitalized-words-mode -1)
  (turn-on-haskell-indentation))
(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)

;----------------------------------------------------------------------
; Markdown md
;----------------------------------------------------------------------

;(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;----------------------------------------------------------------------
; Python
;----------------------------------------------------------------------

(defun eu-python-mode-setup ()
  (interactive)
  (set (make-local-variable 'electric-indent-chars) '()))

(add-hook 'python-mode-hook 'eu-python-mode-setup)

(defun eu-python-func-delimiter ()
  (interactive)
  (beginning-of-line)
  (insert "# ======================================================================\n"))

(define-key python-mode-map "\M-=" 'eu-python-func-delimiter)

(add-hook 'python-mode-hook 'abbrev-mode)

(define-key python-mode-map [?\A-\M-t] '(lambda () (interactive) (insert "True")))
(define-key python-mode-map [?\A-\M-f] '(lambda () (interactive) (insert "False")))
(define-key python-mode-map [?\A-\M-n] '(lambda () (interactive) (insert "None")))

(defun eu-python-indent-line ()
  (interactive)
  (if (use-region-p)
      (call-interactively 'py-indent-line)
    (if (and (eq this-command last-command) (> (current-column) 0))
        (let ((cc1 (current-column)))
          (beginning-of-line)
          (fixup-whitespace)
          (indent-to (- cc1 py-indent-offset))
          ;(message "%d -> %d %d" cc1 (current-column) (- (current-column) py-indent-offset))
          )
      (py-indent-line-outmost))))

(define-key python-mode-map "\t" 'eu-python-indent-line)

;----------------------------------------------------------------------

(provide 'eu-mode)

;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
