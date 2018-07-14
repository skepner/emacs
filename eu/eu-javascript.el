;(modify-syntax-entry ?_ "w" js-mode-syntax-table)
;(define-key js-mode-map "\C-m" 'newline-and-indent)
;(define-key js-mode-map "\C-j" 'newline)
;(setq interpreter-mode-alist (cons '("node" . js-mode) interpreter-mode-alist))

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq interpreter-mode-alist (cons '("node" . js2-mode) interpreter-mode-alist))

(defun eu-js2-mode-setup ()
  (interactive)
  (modify-syntax-entry ?_ "w" js2-mode-syntax-table)
  (define-key js2-mode-map [C-right] 'forward-sexp)
  (define-key js2-mode-map [M-right] 'forward-paragraph)
  (define-key js2-mode-map [A-right] 'forward-word)
  (define-key js2-mode-map [C-left] 'backward-sexp)
  (define-key js2-mode-map [M-left] 'backward-paragraph)
  (define-key js2-mode-map [A-left] 'backward-word)
  (define-key js2-mode-map [home] 'js2-beginning-of-line)
  (define-key js2-mode-map [end] 'js2-end-of-line)
  (define-key js2-mode-map [f8] 'next-error)
  (define-key js2-mode-map [down-mouse-3] 'msb)
  (define-key js2-mode-map "\C-m" 'newline-and-indent)
  (abbrev-mode 1)
  (set (make-local-variable 'electric-indent-chars) '(?{ ?} ?( ?) ?[ ?] ?: ?\; ?, ?* ?\n))
  (electric-indent-mode t)
)

(add-hook 'js-mode-hook 'eu-js2-mode-setup)

; auto-complete
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq ac-js2-evaluate-calls t)

;----------------------------------------------------------------------
; Coffeescript
;----------------------------------------------------------------------

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

;; ----------------------------------------------------------------------
;  Typescript
;; ----------------------------------------------------------------------

(require 'typescript-mode)

(add-to-list 'compilation-error-regexp-alist-alist
             '(typescript "^\\([A-Za-z0-9\\.][^(]+\\)(\\([0-9]+\\),\\([0-9]+\\)) *: +\\(error\\|fatal error\\|\\(warning\\)\\) [A-Z]+[0-9]+:.*" 1 2 3 (5 . nil)))
(add-to-list 'compilation-error-regexp-alist 'typescript)

(modify-syntax-entry ?_ "w" typescript-mode-syntax-table)

(defun eu-typescript_to-remove-comment (beg end)
  (interactive "*r")
  (if (> beg end) (let (mid) (setq mid beg beg end end mid)))
  (save-excursion
    (goto-char beg)
    (skip-chars-forward " \t\n\r")
    (beginning-of-line)
    (while (< (point) end)
      (progn
        (insert "//!")
        (setq end (+ end 3))
        (forward-line)))))

(define-key typescript-mode-map [?\A-\M-:] 'eu-typescript_to-remove-comment)

;; ; tide (https://github.com/ananthakumaran/tide)
;; (defun setup-tide-mode ()
;;   (interactive)
;;   (tide-setup)
;;   (flycheck-mode +1)
;;   (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;   (eldoc-mode +1)
;;   ;; company is an optional dependency. You have to
;;   ;; install it separately via package-install
;;   (company-mode +1))

;; (add-hook 'before-save-hook 'tide-format-before-save)

;; (setq tide-format-options
;;       '(:insertSpaceAfterCommaDelimiter t
;;         :insertSpaceAfterCommaDelimiter t
;;         :insertSpaceBeforeAndAfterBinaryOperators t
;;         :insertSpaceAfterKeywordsInControlFlowStatements t
;;         :insertSpaceAfterFunctionKeywordForAnonymousFunctions t
;;         :placeOpenBraceOnNewLineForFunctions nil))
;; ;; see https://github.com/Microsoft/TypeScript/blob/cc58e2d7eb144f0b2ff89e6a6685fb4deaa24fde/src/server/protocol.d.ts#L421-473 for the full list available options

;; (add-hook 'typescript-mode-hook #'setup-tide-mode)
;; (add-hook 'js2-mode-hook #'setup-tide-mode)

;----------------------------------------------------------------------
; JSON
;----------------------------------------------------------------------

; see built-in json.el

;; ; http://irreal.org/blog/?p=354
;; (defun json-pretty-print ()
;;   (interactive)
;;   (let ((m (mark)) (e (point)))
;;     (if (not m)
;;         (progn
;;           (setq m (point-min))
;;           (setq e (point-max))))
;;     (save-excursion
;;       (shell-command-on-region m e "python -m json.tool" (buffer-name) t))))

;----------------------------------------------------------------------
; CSS
;----------------------------------------------------------------------

; (require 'mon-css-complete)

(define-key css-mode-map "\C-m" 'newline-and-indent)
(define-key css-mode-map "\C-j" 'newline)

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
