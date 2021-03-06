(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-trigger-key "C-c TAB")
 '(after-save-hook
   (quote
    (executable-make-buffer-file-executable-if-script-p)))
 '(auto-save-file-name-transforms
   (quote
    (("\\`/[^/]*:\\([^/]*/\\)*\\([^/]*\\)\\'" "~/.emacs.d/auto-save/remote-\\2" t)
     (".*" "~/.emacs.d/auto-save/" t))))
 '(autopair-global-mode t)
 '(backup-directory-alist
   (quote
    (("/r/.+" . "/r/backup/emacs")
     ("/Volumes/rdisk/.+" . "/r/backup/emacs")
     ("." . "~/.emacs.d/backup"))))
 '(blink-cursor-mode nil)
 '(cc-search-directories
   (quote
    ("." "/usr/include" "/usr/local/include/*" "/Users/eu/AD/include")))
 '(clang-format-executable "/usr/local/opt/llvm/bin/clang-format")
 '(clang-rename-binary "/usr/local/opt/llvm//bin/clang-rename")
 '(coffee-tab-width 2)
 '(col-highlight-period 3)
 '(compilation-error-regexp-alist
   (quote
    (less-css bash python-tracebacks-and-caml cmake cmake-info comma clang-include gcc-include gnu)))
 '(cursor-type (quote box))
 '(dash-at-point-mode-alist
   (quote
    ((actionscript-mode . "actionscript")
     (arduino-mode . "arduino")
     (c++-mode . "cpp,javascript,boost,qt,cvcpp,cocos2dx,c,manpages")
     (c-mode . "c,glib,gl2,gl3,gl4,manpages")
     (caml-mode . "ocaml")
     (clojure-mode . "clojure")
     (coffee-mode . "coffee")
     (common-lisp-mode . "lisp")
     (cperl-mode . "perl")
     (css-mode . "css,bootstrap,foundation,less,awesome,cordova,phonegap")
     (dart-mode . "dartlang,polymerdart,angulardart")
     (elixir-mode . "elixir")
     (emacs-lisp-mode . "elisp")
     (enh-ruby-mode . "ruby")
     (erlang-mode . "erlang")
     (gfm-mode . "markdown")
     (go-mode . "go,godoc")
     (groovy-mode . "groovy")
     (haml-mode . "haml")
     (haskell-mode . "haskell")
     (html-mode . "html,svg,css,bootstrap,foundation,awesome,javascript,jquery,jqueryui,jquerym,angularjs,backbone,marionette,meteor,moo,prototype,ember,lodash,underscore,sencha,extjs,knockout,zepto,cordova,phonegap,yui")
     (jade-mode . "jade")
     (java-mode . "java,javafx,grails,groovy,playjava,spring,cvj,processing,javadoc")
     (js2-mode . "javascript,backbone,angularjs")
     (js3-mode . "nodejs")
     (latex-mode . "latex")
     (less-css-mode . "less")
     (lua-mode . "lua,corona")
     (markdown-mode . "markdown")
     (nginx-mode . "nginx")
     (objc-mode . "cpp,iphoneos,macosx,appledoc,cocoapods,cocos2dx,cocos2d,cocos3d,kobold2d,sparrow,c,manpages")
     (perl-mode . "perl,manpages")
     (php-mode . "php,wordpress,drupal,zend,laravel,yii,joomla,ee,codeigniter,cakephp,phpunit,symfony,typo3,twig,smarty,phpp,html,mysql,sqlite,mongodb,psql,redis")
     (processing-mode . "processing")
     (puppet-mode . "puppet")
     (python-mode . "python3,django,twisted,sphinx,flask,tornado,sqlalchemy,numpy,scipy,saltcvp")
     (ruby-mode . "ruby,rubygems,rails")
     (rust-mode . "rust")
     (sass-mode . "sass,compass,bourbon,neat,css")
     (scala-mode . "scala,akka,playscala,scaladoc")
     (stylus-mode . "stylus")
     (tcl-mode . "tcl")
     (tuareg-mode . "ocaml")
     (twig-mode . "twig")
     (vim-mode . "vim")
     (yaml-mode . "chef,ansible"))))
 '(desktop-globals-to-save
   (quote
    (desktop-missing-file-warning tags-file-name tags-table-list search-ring regexp-search-ring register-alist file-name-history compile-history command-history grep-history query-replace-history shell-command-history kill-ring comint-input-ring file-name-history desktop-locals-to-save truncate-lines case-fold-search case-replace line-number-mode read-expression-history regexp-history)))
 '(desktop-save t)
 '(desktop-save-mode t)
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(enable-local-eval t)
 '(epg-gpg-program "/usr/local/bin/gpg")
 '(find-file-visit-truename t)
 '(flycheck-c/c++-clang-executable "/usr/local/opt/llvm/bin/clang")
 '(global-whitespace-mode t)
 '(gnus-summary-line-format
   "%U%R%z%I%(%[%4L: %-23,23f%]%) %(%&user-date;  %-15,15f  %B%s%)
")
 '(helm-ag-base-command "/usr/local/bin/ag --nocolor --nogroup")
 '(helm-ag-fuzzy-match t)
 '(helm-ag-insert-at-point (quote symbol))
 '(helm-ag-use-agignore t)
 '(helm-allow-mouse nil)
 '(helm-autoresize-mode t)
 '(helm-buffer-max-length 70)
 '(helm-ff-auto-update-initial-value t)
 '(helm-locate-command "mdfind -name %s %s")
 '(helm-semantic-display-style
   (quote
    ((python-mode . semantic-format-tag-summarize)
     (c-mode . semantic-format-tag-concise-prototype-c-mode)
     (c++-mode . semantic-format-tag-canonical-name)
     (emacs-lisp-mode . semantic-format-tag-abbreviate-emacs-lisp-mode))))
 '(helm-semantic-fuzzy-match t)
 '(helm-source-names-using-follow
   (quote
    ("Search at ~/AD/sources/acmacs-api/cc/" "Search at ~/AD/sources/acmacs-webserver/cc/")))
 '(helm-top-poll-mode nil)
 '(helm-yas-space-match-any-greedy t)
 '(hippie-expand-try-functions-list
   (quote
    (try-expand-dabbrev try-complete-file-name try-expand-all-abbrevs try-expand-list try-complete-file-name-partially try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-complete-lisp-symbol-partially try-complete-lisp-symbol try-expand-line)))
 '(hippie-expand-verbose nil)
 '(history-length 1000)
 '(ibuffer-formats
   (quote
    ((mark modified read-only " "
           (name 60 60 :left :elide)
           " "
           (size 9 -1 :right)
           " "
           (mode 16 16 :left :elide)
           " " filename-and-process)
     (mark " "
           (name 16 -1)
           " " filename))))
 '(imenu-eager-completion-buffer nil)
 '(imenu-max-items 50)
 '(imenu-sort-function (quote imenu--sort-by-name))
 '(indent-tabs-mode nil)
 '(ispell-program-name "/usr/local/bin/ispell")
 '(ivy-count-format "(%d/%d) ")
 '(ivy-use-virtual-buffers t)
 '(jka-compr-compression-info-list
   (quote
    (["\\.Z\\'" "compressing" "compress"
      ("-c")
      "uncompressing" "gzip"
      ("-c" "-q" "-d")
      nil t "\235"]
     ["\\.bz2\\'" "bzip2ing" "bzip2" nil "bunzip2ing" "bzip2"
      ("-d")
      nil t "BZh"]
     ["\\.tbz2?\\'" "bzip2ing" "bzip2" nil "bunzip2ing" "bzip2"
      ("-d")
      nil nil "BZh"]
     ["\\.\\(?:tgz\\|svgz\\|sifz\\)\\'" "compressing" "gzip"
      ("-c" "-q")
      "uncompressing" "gzip"
      ("-c" "-q" "-d")
      t nil "\213"]
     ["\\.g?z\\'" "compressing" "gzip"
      ("-c" "-q")
      "uncompressing" "gzip"
      ("-c" "-q" "-d")
      t t "\213"]
     ["\\.lz\\'" "Lzip compressing" "lzip"
      ("-c" "-q")
      "Lzip uncompressing" "lzip"
      ("-c" "-q" "-d")
      t t "LZIP"]
     ["\\.lzma\\'" "LZMA compressing" "lzma"
      ("-c" "-q" "-z")
      "LZMA uncompressing" "lzma"
      ("-c" "-q" "-d")
      t t ""]
     ["\\.xz\\'" "XZ compressing" "xz"
      ("-c" "-q")
      "XZ uncompressing" "xz"
      ("-c" "-q" "-d")
      t t "\3757zXZ "]
     ["\\.txz\\'" "XZ compressing" "xz"
      ("-c" "-q")
      "XZ uncompressing" "xz"
      ("-c" "-q" "-d")
      t nil "\3757zXZ "]
     ["\\.dz\\'" nil nil nil "uncompressing" "gzip"
      ("-c" "-q" "-d")
      nil t "\213"]
     ["\\.ace\\'" "XZ compressing" "xz"
      ("-c" "-q")
      "XZ uncompressing" "xz"
      ("-c" "-q" "-d")
      t nil "\3757zXZ "])))
 '(json-reformat:indent-width 2)
 '(kept-new-versions 4)
 '(kept-old-versions 4)
 '(kill-ring-max 500)
 '(large-file-warning-threshold 1000000000)
 '(line-move-visual nil)
 '(line-spacing 0.2)
 '(magit-repository-directories
   (quote
    (("~/ac/acmacs" . 0)
     ("~/AD/sources/acmacs-build" . 0)
     ("~/AD/sources/acmacs-base" . 0)
     ("~/AD/sources/acmacs-api" . 0)
     ("~/AD/sources/acmacs-chart" . 0)
     ("~/AD/sources/acmacs-chart-n" . 0)
     ("~/AD/sources/acmacs-draw" . 0)
     ("~/AD/sources/acmacs-map-draw" . 0)
     ("~/AD/sources/acmacs-tree-maker" . 0)
     ("~/AD/sources/acmacs-webserver" . 0)
     ("~/AD/sources/acmacs-whocc" . 0)
     ("~/AD/sources/hidb" . 0)
     ("~/AD/sources/locationdb" . 0)
     ("~/AD/sources/seqdb" . 0)
     ("~/AD/sources/signature-page" . 0)
     ("~/AD/sources/ssm-report" . 0))))
 '(mail-host-address "skepner.eu")
 '(message-auto-save-directory "~/.emacs.d/auto-save-message")
 '(mime-view-text/html-previewer (quote shr))
 '(mime-view-type-subtype-score-alist
   (quote
    (((text . enriched)
      . 3)
     ((text . richtext)
      . 2)
     ((text . plain)
      . 4)
     ((text . html)
      . mime-view-text/html-entity-score)
     (multipart . mime-view-multipart-entity-score))))
 '(minibuffer-complete-cycle t nil (minibuffer-complete-cycle))
 '(mouse-drag-copy-region t)
 '(mouse-wheel-mode nil)
 '(msb-display-invisible-buffers-p t)
 '(msb-display-most-recently-used 0)
 '(msb-max-menu-items 100)
 '(msb-mode t)
 '(msb-separator-diff 10)
 '(mu4e-attachment-dir "/r/")
 '(mu4e-bookmarks
   (quote
    (("flag:unread AND NOT flag:trashed" "Unread messages" 117)
     ("date:today..now" "Today's messages" 116)
     ("date:7d..now" "Last 7 days" 119)
     ("mime:image/*" "Messages with images" 112)
     ("maildir:/INBOX" "Inbox" 48))))
 '(mu4e-change-filenames-when-moving t)
 '(mu4e-completing-read-function (quote completing-read))
 '(mu4e-compose-dont-reply-to-self t)
 '(mu4e-compose-signature nil)
 '(mu4e-compose-signature-auto-include nil)
 '(mu4e-get-mail-command "mbsync gmail")
 '(mu4e-headers-date-format "%Y-%m-%d")
 '(mu4e-headers-fields
   (quote
    ((:human-date . 12)
     (:flags . 6)
     (:mailing-list . 10)
     (:from . 22)
     (:subject))))
 '(mu4e-headers-include-related t)
 '(mu4e-headers-long-date-format "%Y-%m-%d %H:%M %Z")
 '(mu4e-headers-skip-duplicates t)
 '(mu4e-headers-time-format "%H:%M")
 '(mu4e-headers-visible-lines 20)
 '(mu4e-maildir "/r/mail/mbsync")
 '(mu4e-maildir-shortcuts (quote (("/INBOX" . 48))))
 '(mu4e-mu-binary "/usr/local/bin/mu")
 '(mu4e-sent-messages-behavior (quote delete))
 '(mu4e-update-interval 30)
 '(mu4e-use-fancy-chars t)
 '(mu4e-user-mail-address-list
   (quote
    ("eu@antigenic-cartography.org" "eu.skepner@skepner.eu" "eu@skepner.eu")))
 '(mu4e-view-fields
   (quote
    (:from :to :cc :subject :flags :date :mailing-list :tags :attachments :signature :decryption)))
 '(mu4e-view-scroll-to-next nil)
 '(mu4e-view-show-addresses t)
 '(ns-alternate-modifier (quote alt))
 '(ns-command-modifier (quote meta))
 '(ns-pop-up-frames nil)
 '(nxml-sexp-element-flag t)
 '(nxml-slash-auto-complete-flag t)
 '(package-selected-packages
   (quote
    (col-highlight json-navigator helm-ag ac-rtags ac-js2 ac-html helm-swoop counsel ivy-rtags ivy flycheck-clang-tidy sr-speedbar ess realgud magit clang-format helm-c-yasnippet helm-rtags sass-mode helm-projectile projectile helm-describe-modes helm polymode multi-web-mode csharp-mode ov yasnippet typescript-mode smartparens real-auto-save python-mode minibuffer-complete-cycle markdown-mode less-css-mode json-mode js2-mode jq-mode helm-descbinds helm-dash haskell-mode flycheck elm-mode dash-at-point coffee-mode applescript-mode apache-mode)))
 '(py-shell-name "/bin/false")
 '(python-pdbtrack-activate nil)
 '(python-shell-interpreter "/usr/bin/python")
 '(python-shell-prompt-detect-enabled nil)
 '(real-auto-save-interval 30)
 '(recentf-mode t)
 '(rtags-display-result-backend (quote ivy))
 '(rtags-path "/usr/local/bin")
 '(safe-local-variable-values (quote ((encoding . utf-8) (js-indent-level . 2))))
 '(semantic-imenu-sort-bucket-function (quote semantic-sort-tags-by-name-increasing))
 '(send-mail-function (quote smtpmail-send-it))
 '(server-mode t)
 '(shell-file-name "~/bin/ec")
 '(show-paren-mode t)
 '(show-paren-style (quote mixed))
 '(size-indication-mode t)
 '(smartparens-global-mode nil)
 '(smartparens-global-strict-mode nil)
 '(smtp-local-domain "skepner.eu")
 '(smtpmail-smtp-server "localhost")
 '(smtpmail-smtp-service 25)
 '(speedbar-default-position (quote right))
 '(speedbar-show-unknown-files t)
 '(speedbar-update-flag t)
 '(split-height-threshold 101)
 '(split-width-threshold 360)
 '(tool-bar-mode nil)
 '(tramp-connection-timeout 20 nil (tramp))
 '(transient-mark-mode nil)
 '(truncate-lines t)
 '(typescript-enabled-frameworks (quote (typescript)))
 '(typescript-expr-indent-offset 2)
 '(user-mail-address "eu@antigenic-cartography.org")
 '(vc-make-backup-files t)
 '(w3m-command "/usr/local/bin/w3m")
 '(web-mode-code-indent-offset 2)
 '(whitespace-action (quote (auto-cleanup)))
 '(whitespace-style
   (quote
    (face tabs trailing space-before-tab indentation empty space-after-tab tab-mark)))
 '(wl-smtp-posting-server "localhost")
 '(x-stretch-cursor t)
 '(yas-global-mode t)
 '(yas-prompt-functions
   (quote
    (shk-yas/helm-prompt yas-dropdown-prompt yas-completing-prompt yas-maybe-ido-prompt yas-no-prompt)))
 '(yas-snippet-dirs
   (quote
    ("~/.emacs.d/snippets" "/Users/eu/.emacs.d/elpa/haskell-mode-20150124.1059/snippets")))
 '(yas-use-menu (quote full)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Go Mono"))))
 '(compilation-line-number ((t (:inherit font-lock-string-face))))
 '(font-lock-comment-face ((t (:foreground "green4" :slant italic))))
 '(font-lock-function-name-face ((t (:foreground "dark red" :weight bold))))
 '(font-lock-keyword-face ((t (:foreground "dark red" :weight bold))))
 '(font-lock-string-face ((t (:foreground "dark blue"))))
 '(font-lock-type-face ((t (:foreground "dark red"))))
 '(font-lock-variable-name-face ((t (:foreground "dark magenta"))))
 '(message-cited-text ((t (:foreground "blue"))))
 '(mu4e-link-face ((t (:background "OliveDrab2" :foreground "purple2" :underline t))))
 '(org-done ((t (:foreground "green3" :weight bold))))
 '(org-level-2 ((t (:inherit nil :foreground "dark blue" :weight bold))))
 '(org-level-3 ((t (:inherit outline-4))))
 '(org-level-4 ((t (:inherit outline-5))))
 '(org-level-5 ((t (:inherit nil :foreground "DarkOrange3"))))
 '(outline-1 ((t (:foreground "magenta" :weight bold))))
 '(outline-2 ((t (:foreground "red3" :weight bold))))
 '(outline-3 ((t (:foreground "green4" :weight bold))))
 '(outline-4 ((t (:foreground "Cyan4" :weight bold))))
 '(pulse-highlight-start-face ((t (:background "#FF8000"))))
 '(whitespace-trailing ((t (:foreground "red" :underline (:color foreground-color :style wave) :weight bold))))
 '(wl-highlight-message-cited-text-1 ((t (:foreground "brown"))))
 '(wl-highlight-message-cited-text-2 ((t (:foreground "blue3"))))
 '(wl-highlight-message-cited-text-3 ((t (:foreground "green4"))))
 '(wl-highlight-message-cited-text-4 ((t (:foreground "magenta3"))))
 '(wl-highlight-message-cited-text-5 ((t (:foreground "yellow4"))))
 '(wl-highlight-message-cited-text-7 ((t (:foreground "Pink4"))))
 '(wl-highlight-summary-new-face ((t (:foreground "red" :weight bold)))))
