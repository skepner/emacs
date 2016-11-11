;; ----------------------------------------------------------------------

(require 'polymode)

(defcustom pm-host/nxml
  (pm-bchunkmode "nxml" :mode 'nxml-mode)
  "nXML host chunkmode"
  :group 'hostmodes
  :type 'object)

(defcustom  pm-inner/javascript
  (pm-hbtchunkmode "js"
                   :head-reg  "^[ \t]*<JavaScript>>"
                   :tail-reg  "^[ \t]*</JavaScript>"
                   :font-lock-narrow t)
  "Noweb typical chunk."
  :group 'innermodes
  :type 'object)

(defcustom pm-poly/fuse-ux
  (pm-polymode-multi-auto "fuse-ux"
                   :hostmode 'pm-host/nxml
                   :auto-innermode 'pm-inner/javascript)
  "fuse ux polymode."
  :group 'polymodes
  :type 'object)

(define-polymode poly-fuse-ux-mode pm-poly/fuse-ux)

;; ----------------------------------------------------------------------

(add-to-list 'auto-mode-alist '("\\.unoproj" . json-mode))
(add-to-list 'auto-mode-alist '("\\.uno" . csharp-mode))

;; ----------------------------------------------------------------------

(provide 'eu-andrios)

;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
