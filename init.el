;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defvar eu-emacs-package-dir-root
  (file-name-directory (file-truename user-init-file)))
(add-to-list 'load-path eu-emacs-package-dir-root)
(add-to-list 'load-path (concat eu-emacs-package-dir-root "eu"))

;; ----------------------------------------------------------------------

(require 'ansi-color)
(require 'cc-mode)
(require 'css-mode)
(require 'compile)
(require 'desktop)
(require 'easymenu)
; (require 'elm-mode)
(require 'grep)
(require 'imenu)
(require 'msb)
(require 'pulse)
(require 'recentf)
(require 'tex-mode)

;; ----------------------------------------------------------------------

(defvar eu-packages '(
                      apache-mode
                      applescript-mode
                      coffee-mode
                      csharp-mode       ; for Uno
                      dash-at-point
                      ; elm-mode
                      haskell-mode
                      helm
                      ; helm-dash
                      jq-mode
                      js2-mode
                      json-mode
                      less-css-mode
                      markdown-mode
                      minibuffer-complete-cycle
                      ; polymode          ; .ux obsolete?
                      python-mode
                      real-auto-save
                      smartparens
                      typescript-mode
                      yasnippet
                      )
  "A list of packages to ensure are installed at launch.")
(require 'eu-package)

(autoload 'apache-mode "apache-mode" nil t)
(autoload 'applescript-mode "applescript-mode" "Major mode for editing AppleScript source." t)
(require 'coffee-mode)
(require 'dash-at-point)
(require 'js2-mode)
(require 'json)
(require 'less-css-mode)
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(require 'minibuffer-complete-cycle)
(require 'haskell-mode)
(require 'python-mode)
(require 'real-auto-save)
(require 'smartparens-config)
(require 'typescript-mode)
(require 'yasnippet)

(when (equal system-name "jagd")
  (require 'csharp-mode)
  )

;; ----------------------------------------------------------------------

(require 'eu-ac)
(require 'eu-andrios)
(require 'eu-buffers)
(require 'eu-cc-mode)
(require 'eu-compile)
(require 'eu-emacs)
(require 'eu-env)
(require 'eu-grep)
(require 'eu-javascript)
(require 'eu-keys)
(require 'eu-mode)
(require 'eu-mouse)
(require 'eu-menu)
(require 'eu-projects)

;; ----------------------------------------------------------------------

(setq custom-file (concat eu-emacs-package-dir-root "eu/eu-customizations.el"))
(load custom-file)

;; ----------------------------------------------------------------------
                                        ; no byte-compile-this-file!
