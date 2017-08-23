;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defvar eu-emacs-package-dir-root
  (file-name-directory (file-truename user-init-file)))
(add-to-list 'load-path eu-emacs-package-dir-root)
(add-to-list 'load-path (concat eu-emacs-package-dir-root "eu"))
(add-to-list 'load-path (concat eu-emacs-package-dir-root "cc-mode-5.33"))

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
(require 'sass-mode)
(require 'tex-mode)

;; ----------------------------------------------------------------------

(defvar eu-packages '(
                      apache-mode
                      applescript-mode
                      coffee-mode
                      csharp-mode       ; for Uno
                      dash-at-point
                                        ; elm-mode
                      haml-mode         ; required by sass-mode
                      haskell-mode
                      helm
                      helm-ag
                      helm-descbinds
                      helm-describe-modes
                      ; helm-projectile
                      ; helm-dash
                      jq-mode
                      js2-mode
                      json-mode
                      less-css-mode
                      markdown-mode
                      minibuffer-complete-cycle
                      ; projectile
                      python-mode
                      real-auto-save
                      sass-mode
                      smartparens
                      typescript-mode
                      wanderlust
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
(require 'eu-mode)
(require 'eu-mouse)
(require 'eu-menu)
(require 'eu-projects)
(require 'eu-mail)
(require 'eu-helm)

;; ----------------------------------------------------------------------

; (when (equal system-name "jagd")
;   (require 'eu-andrios)
;   )

;; ----------------------------------------------------------------------

(setq custom-file (concat eu-emacs-package-dir-root "eu/eu-customizations.el"))
(load custom-file)

;; ----------------------------------------------------------------------
                                        ; no byte-compile-this-file!
