;----------------------------------------------------------------------
;  All keyboards
;----------------------------------------------------------------------

(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)
(global-set-key [C-next] 'end-of-buffer)
(global-set-key [C-prior] 'beginning-of-buffer)
;(global-set-key [kp-delete] 'delete-char)

(global-set-key [f2] '(lambda () (interactive) (save-some-buffers t)))
;(global-set-key [C-f4] 'iswitchb-buffer)
;(global-set-key [M-f4] 'imenu)
;(global-set-key [M-f4] 'find-file)
(global-set-key [A-f4] 'find-file-at-point)
(global-set-key [f5] 'delete-other-windows)
(global-set-key [f6] 'other-window)

(global-set-key [f3] 'gr)
(global-set-key [S-f3] 'query-replace-regexp)
(global-set-key [C-S-f3] 're-search-forward)

(defun eu-goto-previous-mark ()
  (interactive)
  (set-mark-command t)
)

(global-set-key [f1] 'set-mark-command)
(global-set-key [M-f1] 'eu-goto-previous-mark)

(global-set-key [f10] 'what-line)
(global-set-key [C-f10] 'goto-line)
(global-set-key [M-f10] 'what-cursor-position)

(global-set-key [f12] 'call-last-kbd-macro)

; undo bindinds are in eu-emacs

(global-set-key [A-f1] 'manual-entry)

(global-set-key "\C-x\M-f" 'find-file-at-point)
;(global-set-key [M-f14] 'find-file-at-point)

(define-key global-map [C-tab] 'hippie-expand)
;(define-key global-map [?\A-\M-\S-\t] 'hippie-expand)
(define-key minibuffer-local-completion-map [C-tab] 'hippie-expand)
(define-key minibuffer-local-map [C-tab] 'hippie-expand)
(define-key minibuffer-local-must-match-map [C-tab] 'hippie-expand)

(global-set-key [f8] 'next-error)

(global-set-key [insert] 'delete-temp-buffers)
;(global-set-key [f15] 'next-buffer)
(global-set-key [f15] 'mode-line-other-buffer)
(global-set-key [C-f15] 'bury-buffer)
(global-set-key [f7] 'mode-line-other-buffer)
(global-set-key [C-f7] 'bury-buffer)
(global-set-key [f13] 'delete-temp-buffers)
(global-set-key [A-f7] 'delete-temp-buffers)

(global-set-key [C-kp-delete] 'kill-this-buffer)
(global-set-key [S-C-kp-delete] 'eu-delete-other-window-buffer)
(global-set-key [C-S-f6] 'eu-buffer-menu)
;(global-set-key [C-f6] 'eu-buffer-menu-files-only)
(global-set-key [C-f6] 'ibuffer)

(global-set-key [?\A-$] 'ispell-word)

(global-set-key "\M-o" 'occur)
(global-set-key [?\A-\M-o] 'eu-occur)
(global-set-key [?\A-\M-e] 'eu-occur-error)
(global-set-key [?\A-\M-w] 'eu-occur-warning)
;; (global-set-key [?\C-\S-r] 'eu-resize-other-window)

(global-set-key "\C-c\C-c" 'comment-region)
(global-set-key [?\A-\M-\;] 'comment-region)
(global-set-key [?\C-\M-\;] 'uncomment-region)

(global-set-key [C-left] 'backward-sexp)
(global-set-key [C-right] 'forward-sexp)
(global-set-key [M-left] 'backward-word)
(global-set-key [M-right] 'forward-word)

(global-set-key "\C-x\C-l" 'find-library)

;; (global-set-key [S-kp-delete] 'delete-trailing-spaces)       ; in the current line
(global-set-key [S-kp-delete] 'delete-trailing-whitespace) ; in the buffer

(global-set-key [M-up] 'eu-scroll-other-window)
(global-set-key [M-down] 'eu-scroll-other-window)

(global-set-key [A-M-down] 'enlarge-window)
(global-set-key [A-M-up] 'shrink-window)

(define-key global-map "\C-xt" 'eu-toggle-truncate-lines)

(global-set-key [S-f9] 'kill-compilation)
(global-set-key [f8] 'next-error)
(global-set-key [S-f8] '(lambda () (interactive) (next-error -1)))

;; (global-set-key (kbd "M-.") 'ido-goto-symbol)
;; (global-set-key [backtab] 'ido-goto-symbol)

(global-set-key [A-backspace] 'backward-kill-word)

(global-set-key (kbd "A-M-l") 'hl-line-mode)

(global-set-key (kbd "A-M-.") 'eu-find-tag-current-word)
(global-set-key (kbd "A-M-,") '(lambda nil (interactive) (find-tag nil t)))

;----------------------------------------------------------------------
; eu-emacs

(global-set-key [f11] 'eu-repeat-complex-command-backward)
(global-set-key [S-f11] 'eu-repeat-complex-command-forward)

;----------------------------------------------------------------------
; macbook pro keyboard

(global-set-key [A-down] 'scroll-up-command)
(global-set-key [A-up] 'scroll-down-command)

;----------------------------------------------------------------------
; helm

(global-set-key [f4] 'helm-mini)
;(global-set-key (kbd "C-x C-f") 'helm-find-files)
;(global-set-key (kbd "M-x") 'helm-M-x)

;----------------------------------------------------------------------

(defun eu-assign-key (key)
  (interactive "kShow current buffer using key: ")
  (if (or (not (global-key-binding key)) (y-or-n-p "Redefine that key? "))
      (let ((action (if (buffer-file-name)
                        `(lambda nil (interactive) (find-file ,(buffer-file-name)))
                      `(lambda nil (interactive) (switch-to-buffer ,(buffer-name))))))
                                        ;(prin1 action)
        (global-set-key key action)
        (message (format "Key assigned to %s" (or (buffer-file-name) (buffer-name)))))))

;----------------------------------------------------------------------

(global-set-key [?\A-,] '(lambda nil (interactive) (switch-to-buffer ",")))

;----------------------------------------------------------------------

(global-set-key "\C-cd" 'dash-at-point)

;----------------------------------------------------------------------

(global-set-key (kbd "M-e") 'eu-copy-sexp)
(global-set-key (kbd "M-r") 'eu-copy-line)
(global-set-key (kbd "A-r") 'eu-pulse-current-line)
(global-set-key (kbd "A-e") 'eu-indent-sexp)

;----------------------------------------------------------------------
; eu-compile

(global-set-key [?\A-\M-1] '(lambda () (interactive) (eu-switch-to-compilation-buffer 1)))
(global-set-key [?\A-\M-2] '(lambda () (interactive) (eu-switch-to-compilation-buffer 2)))
(global-set-key [?\A-\M-3] '(lambda () (interactive) (eu-switch-to-compilation-buffer 3)))
(global-set-key [?\A-\M-4] '(lambda () (interactive) (eu-switch-to-compilation-buffer 4)))
(global-set-key [?\A-\M-5] '(lambda () (interactive) (eu-switch-to-compilation-buffer 5)))
(global-set-key [?\A-\M-0] 'eu-switch-to-compilation-autoclose-buffer)

(define-key compilation-mode-map "\C-cr" 'rename-uniquely)
;(define-key compilation-mode-map [mouse-2] 'c++-demangle-mouse)
(define-key compilation-mode-map [f7] 'compile-goto-error)
(define-key compilation-mode-map [mouse-3] 'compile-mouse-goto-error)
(define-key compilation-mode-map [down-mouse-2] 'msb)

(global-set-key [f9] 'eu-compile)
(global-set-key [C-f9] 'eu-compile-no-ask)
(global-set-key [A-C-M-kp-8] 'eu-compile-no-ask)
(global-set-key [A-f9] 'eu-compile-cd-pwd)

;----------------------------------------------------------------------
; eu-ac

(global-set-key [?\C-\A-\M-a] 'eu-antigen-serum)

;; (global-set-key [?\A-\M-r] '(lambda nil (interactive) (find-file "/Users/eu/Shared/AC/rd-links.txt")))
;; (global-set-key [?\A-\M-i] '(lambda nil (interactive) (find-file "/Users/eu/ac/acmacs-b/b3/bin/who-index-page-generator.py")))
(global-set-key [?\A-\M-z] '(lambda nil (interactive) (find-file "/Users/eu/Shared/AC/todo.txt")))
(global-set-key [?\A-\M-x] '(lambda nil (interactive) (find-file "~/Google Drive/ASS/Eu/todo.txt")))
(global-set-key [?\A-\M-t] '(lambda nil (interactive) (find-file "~/ac/acmacs/docs/template")))

;; (global-set-key (kbd "A-m") '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs-web/yui/acmacs/js/cherry-map.js")))
;; (global-set-key [?\A-c] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs-web/yui/acmacs/js/cherry-chart.js")))
;; (global-set-key [?\A-h] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs-web/yui/acmacs/js/cherry-chain.js")))
;; (global-set-key [?\A-i] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs-web/yui/acmacs/js/cherry-inspector.js")))
;; (global-set-key [?\A-e] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs-web/yui/acmacs/js/cherry-extensions.js")))
;; (global-set-key [?\A-a] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs-web/yui/acmacs/js/cherry-application.js")))
;; (global-set-key [?\A-t] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs-web/yui/acmacs/js/cherry-text.js")))
;; (global-set-key [?\A-s] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs-web/yui/acmacs/js/cherry-chart-selector.js")))

;; (global-set-key [?\A-\M-c] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs/mongodb_collections/chart.py")))

;; (global-set-key [?\A-b] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs-web/static/brazil/brazil.coffee")))
;; (global-set-key [?\A-n] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs-web/static/brazil/brazil.less")))

;; (global-set-key [?\A-3] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs-web/static/brazil/canvas-3d.coffee")))

;; (global-set-key [?\C-\M-m] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs/core/markings.py")))
;; (global-set-key [?\A-\M-m] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs-web/yui/acmacs/js/cherry-markings.js")))

;----------------------------------------------------------------------
; Scroll Other Window by Meta-Arrows
;----------------------------------------------------------------------

(defun eu-scroll-other-window ()
  (interactive)
  (let ((keys (this-command-keys)) (scroll-in-place nil))
    (if (arrayp keys)
    (cond ((string-equal (symbol-name (aref keys 0)) "M-down")
           (scroll-other-window 1))
          ((string-equal (symbol-name (aref keys 0)) "M-up")
           (scroll-other-window -1))
          ((string-equal (symbol-name (aref keys 0)) "M-f29")
           (scroll-other-window (- 3 (window-height (next-window)))))
          ((string-equal (symbol-name (aref keys 0)) "M-f35")
           (scroll-other-window nil))
    ))))

;----------------------------------------------------------------------
; eu-buffers

(global-set-key [S-f5] 'eu-shrink-other-window-if-larger-than-buffer)
(global-set-key [C-down] 'shrink-window)
(global-set-key [C-up] 'enlarge-window)

;----------------------------------------------------------------------

(provide 'eu-keys)

;----------------------------------------------------------------------
;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
