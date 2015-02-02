(define-key js-mode-map "\M-=" 'eu-js-func-delimiter)
(modify-syntax-entry ?_ "w" js-mode-syntax-table)
;(define-key js-mode-map "\C-m" 'newline-and-indent)
;(define-key js-mode-map "\C-j" 'newline)
;(setq interpreter-mode-alist (cons '("node" . js-mode) interpreter-mode-alist))

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq interpreter-mode-alist (cons '("node" . js2-mode) interpreter-mode-alist))

(add-hook 'js2-mode-hook 'eu-js2-mode-setup)

(defun eu-js2-mode-setup ()
  (interactive)
  (modify-syntax-entry ?_ "w" js2-mode-syntax-table)
  (define-key js2-mode-map "\M-=" 'eu-js-func-delimiter)
  (define-key js2-mode-map [C-right] 'forward-word)
  (define-key js2-mode-map [M-right] 'forward-sexp)
  (define-key js2-mode-map [C-left] 'backward-word)
  (define-key js2-mode-map [M-left] 'backward-sexp)
  (define-key js2-mode-map [home] 'js2-beginning-of-line)
  (define-key js2-mode-map [end] 'js2-end-of-line)
  (define-key js2-mode-map [f8] 'next-error)
  (define-key js2-mode-map [down-mouse-3] 'msb)
  (define-key js2-mode-map "\C-m" 'newline-and-indent)
  (abbrev-mode 1)
  (set (make-local-variable 'electric-indent-chars) '(?{ ?} ?( ?) ?[ ?] ?: ?\; ?, ?* ?\n))
  (electric-indent-mode t)
)

(defun eu-js-func-delimiter ()
  (interactive)
  (beginning-of-line)
  (insert "// ======================================================================\n"))

;----------------------------------------------------------------------
; Coffeescript
;----------------------------------------------------------------------

(defun eu-coffee-func-delimiter ()
  (interactive)
  (beginning-of-line)
  (insert "# ==============================================================================\n"))

(define-key coffee-mode-map [?\M-=] 'eu-coffee-func-delimiter)
(define-key coffee-mode-map [?\A-\M-r] nil)

;; (require 'flymake-coffee)
;; (add-hook 'coffee-mode-hook 'flymake-coffee-load)

;; (defun coffee-custom ()
;;   "coffee-mode-hook"
;;   (make-local-variable 'tab-width)
;;   (set 'tab-width 2))

;; (add-hook 'coffee-mode-hook 'coffee-custom)

(defun eu-browser-traceback-replace ()
  (interactive)
  (while (re-search-forward "↵" nil t)
    (replace-match "\n" nil nil)))

;----------------------------------------------------------------------
; JSON
;----------------------------------------------------------------------

; http://irreal.org/blog/?p=354
(defun json-pretty-print ()
  (interactive)
  (let ((m (mark)) (e (point)))
    (if (not m)
        (progn
          (setq m (point-min))
          (setq e (point-max))))
    (save-excursion
      (shell-command-on-region m e "python -m json.tool" (buffer-name) t))))

;----------------------------------------------------------------------
; CSS
;----------------------------------------------------------------------

; (require 'mon-css-complete)

(define-key css-mode-map "\C-m" 'newline-and-indent)
(define-key css-mode-map "\C-j" 'newline)

(defun eu-css-func-delimiter ()
  (interactive)
  (beginning-of-line)
  (insert "/* ====================================================================== */\n"))

(define-key css-mode-map "\M-=" 'eu-css-func-delimiter)

; (require 'flymake-less)
(add-hook 'less-css-mode-hook 'flymake-less-load)

;----------------------------------------------------------------------

(defun eu-html-pretty (begin end)
  "http://blog.bookworm.at/2007/03/pretty-print-xml-with-emacs.html
Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t)
      (backward-char) (insert "\n"))
    (indent-region begin end)))

;----------------------------------------------------------------------

(provide 'eu-javascript)

;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
