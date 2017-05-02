;;; jq-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "jq-mode" "jq-mode.el" (22578 55079 204843
;;;;;;  452000))
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

;;;### (autoloads nil nil ("jq-mode-pkg.el" "ob-jq.el") (22578 55079
;;;;;;  208843 555000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; jq-mode-autoloads.el ends here
