(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(after-save-hook
   (quote
    (executable-make-buffer-file-executable-if-script-p)))
 '(auto-save-file-name-transforms
   (quote
    (("\\`/[^/]*:\\([^/]*/\\)*\\([^/]*\\)\\'" "/var/folders/db/q2k_xsvx5gn7zp5ykp6016lm0000gn/T/\\2" t)
     (".*" "~/.emacs.d/auto-save/" t))))
 '(autopair-global-mode t)
 '(backup-directory-alist (quote (("." . "~/.emacs.d/backup"))))
 '(blink-cursor-mode nil)
 '(coffee-tab-width 2)
 '(cursor-type (quote box))
 '(desktop-globals-to-save
   (quote
    (desktop-missing-file-warning tags-file-name tags-table-list search-ring regexp-search-ring register-alist file-name-history compile-history command-history grep-history query-replace-history shell-command-history kill-ring comint-input-ring file-name-history desktop-locals-to-save truncate-lines case-fold-search case-replace line-number-mode read-expression-history regexp-history)))
 '(desktop-save t)
 '(desktop-save-mode t)
 '(enable-local-eval t)
 '(epg-gpg-program "/usr/local/bin/gpg")
 '(find-file-visit-truename t)
 '(global-whitespace-mode t)
 '(gnus-summary-line-format
   "%U%R%z%I%(%[%4L: %-23,23f%]%) %(%&user-date;  %-15,15f  %B%s%)
")
 '(helm-buffer-max-length 50)
 '(hippie-expand-try-functions-list
   (quote
    (try-expand-dabbrev try-complete-file-name try-expand-all-abbrevs try-expand-list try-complete-file-name-partially try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-complete-lisp-symbol-partially try-complete-lisp-symbol try-expand-line)))
 '(hippie-expand-verbose nil)
 '(history-length 1000)
 '(imenu-max-items 50)
 '(imenu-sort-function (quote imenu--sort-by-name))
 '(indent-tabs-mode nil)
 '(json-reformat:indent-width 2)
 '(kept-new-versions 4)
 '(kept-old-versions 4)
 '(line-move-visual nil)
 '(mail-host-address "skepner.eu")
 '(message-auto-save-directory "~/.emacs.d/auto-save-message")
 '(minibuffer-complete-cycle t nil (minibuffer-complete-cycle))
 '(mouse-drag-copy-region t)
 '(mouse-wheel-mode nil)
 '(msb-display-invisible-buffers-p t)
 '(msb-max-menu-items 100)
 '(msb-mode t)
 '(ns-alternate-modifier (quote alt))
 '(ns-command-modifier (quote meta))
 '(ns-pop-up-frames nil)
 '(real-auto-save-interval 30)
 '(recentf-mode t)
 '(safe-local-variable-values (quote ((encoding . utf-8) (js-indent-level . 2))))
 '(send-mail-function (quote smtpmail-send-it))
 '(server-mode t)
 '(shell-file-name "~/bin/ec")
 '(show-paren-mode t)
 '(show-paren-style (quote mixed))
 '(size-indication-mode t)
 '(smartparens-global-mode nil)
 '(smartparens-global-strict-mode nil)
 '(smtpmail-smtp-server "localhost")
 '(smtpmail-smtp-service 25)
 '(split-height-threshold 101)
 '(split-width-threshold 360)
 '(tool-bar-mode nil)
 '(transient-mark-mode nil)
 '(truncate-lines t)
 '(typescript-enabled-frameworks (quote (typescript)))
 '(typescript-expr-indent-offset 2)
 '(user-mail-address "eu@antigenic-cartography.org")
 '(vc-make-backup-files t)
 '(whitespace-action (quote (auto-cleanup)))
 '(whitespace-style
   (quote
    (face tabs trailing space-before-tab indentation empty space-after-tab tab-mark)))
 '(x-stretch-cursor t)
 '(yas-global-mode t nil (yasnippet))
 '(yas-snippet-dirs
   (quote
    ("~/.emacs.d/snippets" "/Users/eu/.emacs.d/elpa/haskell-mode-20150124.1059/snippets")) nil (yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Anonymous_Pro"))))
 '(font-lock-comment-face ((t (:foreground "green4" :slant italic))))
 '(font-lock-function-name-face ((t (:foreground "dark red" :weight bold))))
 '(font-lock-keyword-face ((t (:foreground "dark red" :weight bold))))
 '(font-lock-string-face ((t (:foreground "dark blue"))))
 '(font-lock-type-face ((t (:foreground "dark red"))))
 '(font-lock-variable-name-face ((t (:foreground "dark magenta"))))
 '(message-cited-text ((t (:foreground "blue"))))
 '(org-level-2 ((t (:inherit outline-3))))
 '(org-level-3 ((t (:inherit outline-4))))
 '(outline-1 ((t (:foreground "magenta" :weight bold))))
 '(outline-2 ((t (:foreground "red3" :weight bold))))
 '(outline-3 ((t (:foreground "green4" :weight bold))))
 '(outline-4 ((t (:foreground "Cyan4" :weight bold))))
 '(pulse-highlight-start-face ((t (:background "#FF8000")))))
