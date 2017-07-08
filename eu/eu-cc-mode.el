;----------------------------------------------------------------------
; C++ support
;----------------------------------------------------------------------

(defconst eugene-c++-style
  '((c-basic-offset                . 4)
    (c-tab-always-indent           . t)
    (c-comment-only-line-offset    . 2)
    (c-hanging-braces-alist        . ((defun-open      . (before after))
                                      (class-open      . (before after))
                                      (inline-open     . (after))
                                      (block-open      . (after))
                                      (substatement-open . (after))
                                      (brace-list-open . (after))))
    (c-hanging-colons-alist        . ((member-init-intro . (before))
                                      (inher-intro       . ())
                                      (case-label        . (after))
                                      (label             . (after))
                                      (access-key        . (after))))
    (c-cleanup-list                . (scope-operator
                                      empty-defun-braces
                                      defun-close-semi))
    (c-progress-interval           . 3)
    (c-offsets-alist               . ((topmost-intro-cont    . +)
                                      (arglist-close         . c-lineup-arglist)
                                      (statement-cont        . ++)
                                      (case-label            . 2)
                                      (access-label          . -3)
                                      (inline-open           . +)
                                      (inline-close          . 0)
                                      (substatement-open     . 0)
                                      ))
    (c-echo-semantic-information-p . nil)
    )
  "Eugene's C++ Programming Style")

;; Customizations for all of c-mode, c++-mode, and objc-mode
(defun eugene-c++-mode-common-hook ()
  ;; add my personal style and set it for the current buffer
  (c-add-style "EUGENE" eugene-c++-style t)
  ;; offset customizations not in my-c-style
  ;;(c-set-offset 'member-init-intro '++)
  ;; other customizations
  (setq tab-width 4
        ;; Indentation can insert tabs
        indent-tabs-mode nil)
  ;; we like auto-newline and hungry-delete
  (c-toggle-auto-newline -1)
  (imenu-add-menubar-index)

  (modify-syntax-entry ?_ "w" c++-mode-syntax-table)
  (modify-syntax-entry ?_ "w" c-mode-syntax-table)
                                        ;(modify-syntax-entry ?: "w" c++-mode-syntax-table)
                                        ;(modify-syntax-entry ?~ "w" c++-mode-syntax-table)

  ;; keybindings for C, C++, and Objective-C.  We can put these in
  ;; c-mode-base-map because c++-mode-map and objc-mode-map inherit it
  (define-key c-mode-base-map "\C-m" 'newline-and-indent)
  (define-key c-mode-base-map "\C-j" 'newline)

  (define-key c-mode-base-map [backspace] 'c-electric-delete)	;BackSpace
  (define-key c-mode-base-map "\177" 'delete-char) ; delete

  (define-key c-mode-map "\M-j" nil)
  (define-key c++-mode-map "\M-j" nil)

  (define-key c-mode-base-map [(alt ?`)] 'insert-include)
  (define-key c-mode-base-map [(alt meta ?`)] 'insert-local-include)
  (define-key c-mode-base-map "\C-cC" 'make-cc-file)
  (define-key c-mode-base-map "\C-cI" 'make-icc-file)
  (define-key c++-mode-map "\C-cc" 'make-class-decl)
  (define-key c-mode-base-map "\C-cf" 'c-make-function-implementation)
  (define-key c++-mode-map "\C-cf" 'c++-make-function-implementation)
  (define-key c-mode-base-map "\C-cH" 'make-h-file)
  (define-key c-mode-base-map [C-f3] 'ff-find-other-file)

  (define-key c-mode-base-map [C-tab] (make-hippie-expand-function
                                       '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-line)))
  (define-key c++-mode-map [C-tab] (make-hippie-expand-function
                                    '(try-expand-dabbrev
                                      try-expand-dabbrev-all-buffers
                                      try-expand-line)))

  (define-key c++-mode-map "\C-cb" 'eu-br-find)

  (define-key c-mode-base-map "\C-c\C-k" 'eu-comment-word)
  (define-key c-mode-base-map "\C-c\C-r" 'eu-comment-region)

    ;(define-key c++-mode-map (quote [4194402]) '(lambda () (interactive) (insert "begin()"))) ; Alt-b
    ;(define-key c++-mode-map (quote [4194405]) '(lambda () (interactive) (insert "end()"))) ; Alt-e
    ;(define-key c++-mode-map "\M-b" '(lambda () (interactive) (insert "begin()"))) ; Alt-b
    ;(define-key c++-mode-map "\M-e" '(lambda () (interactive) (insert "end()"))) ; Alt-e

  (abbrev-mode 1)
    )

(add-hook 'c-mode-common-hook 'eugene-c++-mode-common-hook)
(add-hook 'java-mode-hook 'eugene-c++-mode-common-hook)

;----------------------------------------------------------------------
; Imenu support fixes
;----------------------------------------------------------------------

(setq cc-imenu-c++-generic-expression
  `(
    ;; Try to match ::operator definitions first. Otherwise `X::operator new ()'
    ;; will be incorrectly recognised as function `new ()' because the regexps
    ;; work by backtracking from the end of the definition.
    (nil
     ,(concat
       "^\\<.*"
       "[^" c-alnum "_:<>~]"                  ; match any non-identifier char
                                              ; (note: this can be `\n')
       "\\("
          "\\([" c-alnum "_:<>~]*::\\)?"      ; match an operator
          "operator\\>[ \t]*"
          "\\(()\\|[^(]*\\)"                  ; special case for `()' operator
       "\\)"

       "[ \t]*([^)]*)[ \t]*[^ \t;]"           ; followed by ws, arg list,
                                              ; require something other than
                                              ; a `;' after the (...) to
                                              ; avoid prototypes.  Can't
                                              ; catch cases with () inside
                                              ; the parentheses surrounding
                                              ; the parameters.  e.g.:
                                              ; `int foo(int a=bar()) {...}'
       ) 1)
    ;; Special case to match a line like `main() {}'
    ;; e.g. no return type, not even on the previous line.
    (nil
     ,(concat
       "^"
       "\\([" c-alpha "_][" c-alnum "_:<>~]*\\)" ; match function name
       "[ \t]*("                              ; see above, BUT
       "[ \t]*\\([^ \t(*][^)]*\\)?)"          ; the arg list must not start
       "[ \t]*[^ \t;(]"                       ; with an asterisk or parentheses
       ) 1)
    ;; General function name regexp
    (nil
     ,(concat
       "^\\<"                                 ; line MUST start with word char
       ;; \n added to prevent overflow in regexp matcher.
       ;; http://lists.gnu.org/archive/html/emacs-pretest-bug/2007-02/msg00021.html
       "[^()\n]*"                             ; no parentheses before
       "[^" c-alnum "_:<>~]"                  ; match any non-identifier char
       "\\([" c-alpha "_][" c-alnum "_:<>~]*\\)" ; match function name
       "\\([ \t\n]\\|\\\\\n\\)*("             ; see above, BUT the arg list
       "\\([ \t\n]\\|\\\\\n\\)*\\([^ \t\n(*][^)]*\\)?)" ; must not start
       "\\([ \t\n]\\|\\\\\n\\)*[^ \t\n;(]"    ; with an asterisk or parentheses
       ) 1)
    ;; Special case for definitions using phony prototype macros like:
    ;; `int main _PROTO( (int argc,char *argv[]) )'.
    ;; This case is only included if cc-imenu-c-prototype-macro-regexp is set.
    ;; Only supported in c-code, so no `:<>~' chars in function name!
    ,@(if cc-imenu-c-prototype-macro-regexp
            `((nil
                 ,(concat
                   "^\\<.*"                   ; line MUST start with word char
                   "[^" c-alnum "_]"          ; match any non-identifier char
                   "\\([" c-alpha "_][" c-alnum "_]*\\)" ; match function name
                   "[ \t]*"                   ; whitespace before macro name
                   cc-imenu-c-prototype-macro-regexp
                   "[ \t]*("                  ; ws followed by first paren.
                   "[ \t]*([^)]*)[ \t]*)[ \t]*[^ \t;]" ; see above
                   ) 1)))
    ;; Class definitions
    ("Class"
     ,(concat
         "^[ \t]*"                                  ; beginning of line is required
         "\\(template[ \t]*<[^>]+>[ \t]*\\)?" ; there may be a `template <...>'
         "\\(class\\|struct\\)[ \t]+"
         "\\("                                ; the string we want to get
         "[" c-alnum "_]+"                    ; class name
         "\\(<[^>]+>\\)?"                     ; possibly explicitly specialized
         "\\)"
         "\\([ \t\n]\\|\\\\\n\\)*[:{]"
         ) 3)))

;----------------------------------------------------------------------

(defun c++-make-function-implementation (count)
  (interactive "p")
  (while (> count 0)
    (let ((e (save-excursion (end-of-line) (point))))
      (beginning-of-line)
      (if (search-forward "virtual" e t)
          (delete-char -7))
      (beginning-of-line)
      (if (search-forward "static" e t)
          (delete-char -6))
      (beginning-of-line)
      (delete-horizontal-space)
      (while (search-forward ";" e t)     ; delete `;' at the current line
        (delete-char -1))
      (beginning-of-line)
      (search-forward "(" e)
      (setq e (1- (point)))
      (forward-word -1)
      (while (or (= (preceding-char) ?:) (= (preceding-char) ?<) (= (preceding-char) ?~))
        (forward-word -1))
      (kill-new (buffer-substring (point) e))	; save function name
      (end-of-line)
      ;(delete-trailing-spaces)
      (insert "\n{\n\n} // ")
      (yank)
      (insert "\n\n")
      (eu-func-delimiter)
      (forward-line)
      (setq count (1- count)))))

;----------------------------------------------------------------------

(defun c-make-function-implementation (count)
  (interactive "p")
  (while (> count 0)
    (let ((e (save-excursion (end-of-line) (point))))
      (beginning-of-line)
      ;(if (search-forward "static" e t)
      ;    (delete-char -6))
      ;(beginning-of-line)
      (delete-horizontal-space)
      (while (search-forward ";" e t)     ; delete `;' at the current line
        (delete-char -1))
      (beginning-of-line)
      (search-forward "(" e)
      (setq e (1- (point)))
      (forward-word -1)
      (kill-new (buffer-substring (point) e))	; save function name
      (end-of-line)
      ;(delete-trailing-spaces)
      (insert "\n{\n\n} /* ")
      (yank)
      (insert " */\n\n")
      (eu-func-delimiter)
      (forward-line)
      (setq count (1- count)))))

;----------------------------------------------------------------------

;; (defun insert-include ()
;;   "inserts the `#include <>' in buffer"
;;   (interactive)
;;   (insert "#include <>")
;;   (backward-char 1))

;----------------------------------------------------------------------

;; (defun insert-local-include (arg)
;;   "inserts the `#include \"My.h\"' in buffer"
;;   (interactive "fInsert include directives for .h: ")
;;   (let* ((arg (file-name-nondirectory arg))
;;       (ili-ndef (make-header-define-name (concat "" arg)))
;;       (ili-count 0))
;;     (insert "#ifndef " ili-ndef "\n#include \"")
;;     (let ((p (point)))
;;       (insert arg "\"\n#endif\n\n")
;;       (goto-char p))))

;;----------------------------------------------------------------------

(defun eu-comment-word (arg)
  (interactive "P")
  (if arg
      (save-excursion
        (if (looking-at "/\\*")
            (progn
              (delete-char 2 nil)
              (forward-word 1)
              (if (looking-at "\\*/")
                  (delete-char 2 nil))))
        )
    (save-excursion
      (insert "/*")
      (forward-word 1)
      (insert "*/")
      )))

(defun eu-comment-region (beg end arg)
  (interactive (list (mark) (point) current-prefix-arg))
  (if arg
      (save-excursion
        (goto-char (- end 3))
        (if (looking-at " \\*/")
            (delete-char 3 nil)
          (progn
            (forward-char)
            (if (looking-at "\\*/")
                (delete-char 2 nil))))
        (goto-char beg)
        (if (looking-at "/\\* ")
            (delete-char 3 nil)
          (if (looking-at "/\\*")
              (delete-char 2 nil))))
    (save-excursion
      (goto-char end)
      (insert " */")
      (goto-char beg)
      (insert "/* ")
      )))

;----------------------------------------------------------------------

;; (defun make-h-file ()
;; "Inserts
;; #ifndef _filename_suffix
;; #define _filename_suffix
;; #endif // _filename_suffix
;; in the current buffer"
;;   (interactive)
;;   (let ((make-hh-name (substring (buffer-name) 0 (- (length (buffer-name)) 3)))
;;      (make-ifndef-name (make-header-define-name (buffer-name))))
;;     (my-c++-insert-header)
;;     (insert "\n")
;;     (goto-char (point-min))
;;     (next-line 2)
;;     (insert "#ifndef " make-ifndef-name "\n#define " make-ifndef-name "\n\n")
;;     (insert "#ifdef __GNUG__\n#pragma interface\n#endif\n\n")
;;     (eu-func-delimiter)
;;     (insert "\n\n")
;; ;    (eu-func-delimiter)
;; ;    (insert "\n#if INLINES_INSIDE_HH\n#include \"" (downcase make-hh-name) ".icc\"\n#endif\n\n")
;; ;    (eu-func-delimiter)
;;     (insert "\n#endif // " make-ifndef-name "\n\n")
;;     (my-c++-insert-header)
;;     (next-line -6)))

;======================================================================

(autoload 'awk-mode "cc-mode" nil t)

;----------------------------------------------------------------------

(provide 'eu-cc-mode)

;----------------------------------------------------------------------
;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
