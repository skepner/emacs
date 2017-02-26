;; ----------------------------------------------------------------------
;; ----------------------------------------------------------------------

(semantic-mode 1)

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
  (eu-compile-autoclose (concat "latex-view '" buffer-file-name "'")))

(define-key tex-mode-map [f9] 'eu-latex-view)

;----------------------------------------------------------------------
; Haskell
;----------------------------------------------------------------------

(defun eu-haskell-mode-hook ()
  (local-set-key "\C-cl" 'hs-lint)
  (turn-on-haskell-indentation)
  )
(add-hook 'haskell-mode-hook 'eu-haskell-mode-hook)

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

(add-hook 'python-mode-hook 'abbrev-mode)

(define-key python-mode-map [?\A-\M-t] '(lambda () (interactive) (insert "True")))
(define-key python-mode-map [?\A-\M-f] '(lambda () (interactive) (insert "False")))
(define-key python-mode-map [?\A-\M-n] '(lambda () (interactive) (insert "None")))
(define-key python-mode-map "\r" 'py-newline-and-indent)
(define-key python-mode-map [?\C-j] 'newline)

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
; func delimiter
;----------------------------------------------------------------------

(defun eu-func-delimiter-char (c)
  (beginning-of-line)
  (let ((start (point)))
    (insert (concat (make-string 70 c) "\n"))
    (comment-region start (point))))

(defun eu-func-delimiter ()
  (interactive)
  (eu-func-delimiter-char ?-))

(defun eu-func-delimiter2 ()
  (interactive)
  (eu-func-delimiter-char ?=))

(defun eu-func-delimiter3 ()
  (interactive)
  (eu-func-delimiter-char ?*))

(defun eu-func-delimiter4 ()
  (interactive)
  (eu-func-delimiter-char ?x))

(defun eu-func-delimiter-set-hook ()
  (define-key (current-local-map) [?\M-=] 'eu-func-delimiter)
  (define-key (current-local-map) [?\M-+] 'eu-func-delimiter2)
  (define-key (current-local-map) [?\A-\M-=] 'eu-func-delimiter3)
  (define-key (current-local-map) [?\A-\M-+] 'eu-func-delimiter4))

(add-hook 'c++-mode-hook 'eu-func-delimiter-set-hook)
(add-hook 'c-mode-hook 'eu-func-delimiter-set-hook)
(add-hook 'coffee-mode-hook 'eu-func-delimiter-set-hook)
(add-hook 'css-mode-hook 'eu-func-delimiter-set-hook)
(add-hook 'emacs-lisp-mode-hook 'eu-func-delimiter-set-hook)
(add-hook 'haskell-mode-hook 'eu-func-delimiter-set-hook)
(add-hook 'java-mode-hook 'eu-func-delimiter-set-hook)
(add-hook 'js-mode-hook 'eu-func-delimiter-set-hook)
(add-hook 'js2-mode-hook 'eu-func-delimiter-set-hook)
(add-hook 'latex-mode-hook 'eu-func-delimiter-set-hook)
(add-hook 'makefile-mode-hook 'eu-func-delimiter-set-hook)
(add-hook 'python-mode-hook 'eu-func-delimiter-set-hook)
(add-hook 'typescript-mode-hook 'eu-func-delimiter-set-hook)

;----------------------------------------------------------------------

(provide 'eu-mode)

;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
