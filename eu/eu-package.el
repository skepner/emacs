(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; ----------------------------------------------------------------------

;; Commands suggested by the Emacs starter kit to keep its packages up to date.
(when (not package-archive-contents)
  (package-refresh-contents))
(dolist (p eu-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; ----------------------------------------------------------------------

(provide 'eu-package)

;; ----------------------------------------------------------------------
;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
