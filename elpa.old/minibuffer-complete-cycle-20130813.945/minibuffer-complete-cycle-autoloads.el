;;; minibuffer-complete-cycle-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "minibuffer-complete-cycle" "minibuffer-complete-cycle.el"
;;;;;;  (22578 55087 69045 490000))
;;; Generated autoloads from minibuffer-complete-cycle.el

(autoload 'mcc-define-keys "minibuffer-complete-cycle" "\
Define extra key bindings in the local keymap.
This has no effect unless the `minibuffer-complete-cycle' option is set.

\(fn)" nil nil)

(add-hook 'minibuffer-setup-hook 'mcc-define-keys)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; minibuffer-complete-cycle-autoloads.el ends here
