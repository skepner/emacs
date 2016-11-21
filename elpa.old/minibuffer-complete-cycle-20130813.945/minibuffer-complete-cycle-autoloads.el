;;; minibuffer-complete-cycle-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (mcc-define-keys) "minibuffer-complete-cycle" "minibuffer-complete-cycle.el"
;;;;;;  (21711 35172 471013 248000))
;;; Generated autoloads from minibuffer-complete-cycle.el

(autoload 'mcc-define-keys "minibuffer-complete-cycle" "\
Define extra key bindings in the local keymap.
This has no effect unless the `minibuffer-complete-cycle' option is set.

\(fn)" nil nil)

(add-hook 'minibuffer-setup-hook 'mcc-define-keys)

;;;***

;;;### (autoloads nil nil ("minibuffer-complete-cycle-pkg.el") (21711
;;;;;;  35172 479986 138000))

;;;***

(provide 'minibuffer-complete-cycle-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; minibuffer-complete-cycle-autoloads.el ends here
