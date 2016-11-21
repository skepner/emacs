;;; jq-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (jq-interactively jq-mode) "jq-mode" "jq-mode.el"
;;;;;;  (22375 60030 867404 598000))
;;; Generated autoloads from jq-mode.el

(autoload 'jq-mode "jq-mode" "\
Major mode for jq scripts.
\\{jq-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.jq$" . jq-mode))

(autoload 'jq-interactively "jq-mode" "\
Runs jq interactively on a json buffer.

\(fn BEG END)" t nil)

;;;***

;;;### (autoloads nil nil ("jq-mode-pkg.el" "ob-jq.el") (22375 60030
;;;;;;  927526 24000))

;;;***

(provide 'jq-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; jq-mode-autoloads.el ends here
