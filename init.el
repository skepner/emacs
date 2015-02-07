(defvar eu-emacs-package-dir-root
  (file-name-directory (file-truename user-init-file)))
(add-to-list 'load-path (concat eu-emacs-package-dir-root "eu"))

;; ----------------------------------------------------------------------

(defvar eu-packages '(
                      apache-mode
                      applescript-mode
                      coffee-mode
                      dash-at-point
                      elm-mode
                      haskell-mode
                      helm
                      ; helm-dash
                      js2-mode
                      less-css-mode
                      markdown-mode
                      minibuffer-complete-cycle
                      python-mode
                      real-auto-save
                      smartparens
                      typescript
                      yasnippet
                      )
  "A list of packages to ensure are installed at launch.")
(require 'eu-package)

;; ----------------------------------------------------------------------

(require 'ansi-color)
(autoload 'apache-mode "apache-mode" nil t)
(autoload 'applescript-mode "applescript-mode" "Major mode for editing AppleScript source." t)
(require 'cc-mode)
(require 'css-mode)
(require 'coffee-mode)
(require 'compile)
(require 'dash-at-point)
(require 'desktop)
(require 'easymenu)
(require 'elm-mode)
(require 'grep)
(require 'haskell-mode)
(require 'imenu)
(require 'js2-mode)
(require 'less-css-mode)
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(require 'minibuffer-complete-cycle)
(require 'msb)
(require 'smartparens-config)
(require 'pulse)
(require 'python-mode)
(require 'real-auto-save)
(require 'tex-mode)
(require 'typescript)
(require 'yasnippet)

;; ----------------------------------------------------------------------

(require 'eu-ac)
(require 'eu-buffers)
(require 'eu-cc-mode)
(require 'eu-compile)
(require 'eu-emacs)
(require 'eu-env)
(require 'eu-grep)
(require 'eu-javascript)
(require 'eu-keys)
(require 'eu-menu)
(require 'eu-mode)
(require 'eu-mouse)

;; ----------------------------------------------------------------------

(setq custom-file (concat eu-emacs-package-dir-root "eu/eu-customizations.el"))
(load custom-file)

;; ----------------------------------------------------------------------

;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
