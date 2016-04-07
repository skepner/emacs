;----------------------------------------------------------------------
; Buffers management
;----------------------------------------------------------------------

(setq msb-horizontal-shift-function '(lambda () +50))
(setq msb-item-handling-function 'msb-item-handler)
(setq msb-item-handling-function 'eu-msb-item-handler)

(defun eu-msb-item-handler (buffer &optional maxbuf)
  (let ((name (buffer-name))
        (file-name (file-name-directory (or (buffer-file-name buffer) "")))
        (modified (if (buffer-modified-p) "*" " "))
        (read-only (if buffer-read-only "%" " ")))
    (if file-name
        (format "%s%s %s" modified read-only
                (if (string-match "^[Mm]akefile" name)
                    (format "%-20s %s" name (abbreviate-file-name file-name))
                  name))
                                        ;   (format "%s%s %-20s %s " modified read-only name file-name)
      (format "%s%s %s " modified read-only name))))

;----------------------------------------------------------------------

(setq msb-menu-cond
  '(
    ((and (eq major-mode 'python-mode) buffer-file-name (string-match "acmacs/" buffer-file-name) 'multi) 40 "Acmacs C2 (%d)")
    ((and (eq major-mode 'c++-mode) buffer-file-name (not (string-match "\\.sip$" buffer-file-name)) (string-match "acmacs/" buffer-file-name) 'multi) 40 "Acmacs C2 C++ (%d)")
    ((and (eq major-mode 'c++-mode) buffer-file-name (string-match "\\.sip$" buffer-file-name) (string-match "acmacs/" buffer-file-name) 'multi) 40 "Acmacs C2 sip (%d)")
    ((and (eq major-mode 'python-mode) buffer-file-name (string-match "acmacs-b/b3" buffer-file-name) 'multi) 40 "Acmacs B3 (%d)")
    ((and (eq major-mode 'c++-mode) buffer-file-name (string-match "acmacs-b/b3" buffer-file-name) 'multi) 40 "Acmacs B3 C++ (%d)")
    ((and (eq major-mode 'python-mode) buffer-file-name (string-match "acmacs-b/b1" buffer-file-name) 'multi) 40 "Acmacs B1 (%d)")
    ((and (eq major-mode 'c++-mode) buffer-file-name (string-match "acmacs-b/b1" buffer-file-name) 'multi) 40 "Acmacs B1 C++ (%d)")
    ((and (eq major-mode 'python-mode) buffer-file-name (string-match "acmacs-b/b2" buffer-file-name) 'multi) 40 "Acmacs B2 (%d)")
    ;((and (eq major-mode 'python-mode) buffer-file-name (string-match "acmacs/c1" buffer-file-name) 'multi) 40 "Acmacs C1 (%d)")
    ((and (eq major-mode 'python-mode) buffer-file-name (string-match "seqt/trunk" buffer-file-name) 'multi) 40 "Seqt (%d)")
    ((and (eq major-mode 'python-mode) buffer-file-name (string-match "hita/trunk" buffer-file-name) 'multi) 40 "Hita (%d)")
    ((and (eq major-mode 'python-mode) buffer-file-name (string-match "acmacs-b/a1" buffer-file-name) 'multi) 40 "Acmacs a1 (%d)")
    ((and (eq major-mode 'python-mode) buffer-file-name (string-match "site-packages/django/" buffer-file-name) 'multi) 40 "Django (%d)")
    ((and (eq major-mode 'python-mode) buffer-file-name (string-match "/tmp/" buffer-file-name) 'multi) 40 "Tmp (%d)")
    ((and (eq major-mode 'python-mode) buffer-file-name (string-match "^/\\(System\\|usr\\|Library\\)/" buffer-file-name) 'multi) 40 "Python System (%d)")
    ((and (eq major-mode 'python-mode) buffer-file-name (string-match "/ac/results/" buffer-file-name) 'multi) 40 "Results (%d)")

    ((and (eq major-mode 'python-mode) buffer-file-name (string-match "/GH/" buffer-file-name) 'multi) 50 "Python GH (%d)")
    ((and (eq major-mode 'python-mode) 'multi) 50 "Python (%d)")

    ((and (eq major-mode 'c++-mode) buffer-file-name (string-match "/ac/" buffer-file-name) 'multi) 100 "C++ AC (%d)")
    ((and (eq major-mode 'c++-mode) buffer-file-name (string-match "/GH/" buffer-file-name) 'multi) 100 "C++ GH (%d)")
    ((and (eq major-mode 'c++-mode) buffer-file-name (string-match "/AC/Projects/" buffer-file-name) 'multi) 100 "C++ AC/Projects (%d)")
    ((and buffer-file-name (string-match "^/usr/include" buffer-file-name) 'multi) 100 "C STD Includes (%d)")
    ;((and buffer-file-name (string-match "^/opt/local/include/mongo" buffer-file-name) 'multi) 100 "Mongo C++ Includes (%d)")
    ((and (eq major-mode 'c-mode) 'multi) 110 "C (%d)")
    ((and (eq major-mode 'objc-mode) 'multi) 110 "Obj-C (%d)")
    ((and (eq major-mode 'haskell-mode) 'multi) 111 "Haskell (%d)")

    ((and (eq major-mode 'ess-mode) 'multi) 114 "R (%d)")
    ((and (or (eq major-mode 'coffee-mode)) 'multi) 115 "CoffeScript (%d)")
    ((and (or (eq major-mode 'typescript-mode)) 'multi) 115 "Typescript (%d)")
    ((and (or (eq major-mode 'less-css-mode)) 'multi) 115 "LESS (%d)")
    ((and (or (eq major-mode 'javascript-mode) (eq major-mode 'js-mode) (eq major-mode 'js2-mode)) 'multi) 116 "Javascript (%d)")
    ((and (not (eq buffer-file-name nil)) (string-match "\\.json$" buffer-file-name) 'multi) 116 "JSON (%d)")
    ((and (eq major-mode 'makefile-mode) 'multi) 117 "Makefile (%d)")
    ((and (not (eq buffer-file-name nil)) (string-match "\\.\\(acmacs\\|mds\\)-txt\\(\\.bz2\\)?$" buffer-file-name) 'multi) 119 "Acmacs-Txt (%d)")
    ((and (not (eq buffer-file-name nil)) (string-match "\\.acmacs$" buffer-file-name) 'multi) 119 ".Acmacs (%d)")
    ((and (not (eq buffer-file-name nil)) (string-match "\\.acd1\\(\\.bz2\\)?$" buffer-file-name) 'multi) 119 ".acd1 (%d)")
    ((and (not (eq buffer-file-name nil)) (string-match "\\.pydata\\(\\.bz2\\)?$" buffer-file-name) 'multi) 119 ".pydata (%d)")

    ((and (eq major-mode 'elm-mode) 'multi) 124 "Elm (%d)")
    ((and (eq major-mode 'markdown-mode) 'multi) 125 "Markdown (%d)")

    ((and (and (or (eq major-mode 'cperl-mode) (eq major-mode 'perl-mode))) 'multi) 151 "Perl (%d)")

    ((and (eq major-mode 'css-mode) 'multi) 202 "CSS (%d)")
    ((and (memq major-mode '(nxhtml-mode hm--html-mode html-mode html-helper-mode jsp-html-helper-mode)) 'multi) 203 "HTML (%d)")
    ((and (memq major-mode '(nxml-mode)) 'multi) 203 "XML (%d)")

    ((and (eq major-mode 'emacs-lisp-mode) 'multi) 250 "Elisp (%d)")
    ((and (eq major-mode 'custom-mode) 'multi) 250 "Customizations (%d)")
    ((and (eq major-mode 'lisp-mode) 'multi) 251 "Lisp (%d)")

    ((and buffer-file-name (string-match "\\.log$" buffer-file-name) 'multi) 300 "Log (%d)")

    ((and buffer-file-name (string-match "^/.*odette:" buffer-file-name) 'multi) 400 "Odette ssh (%d)")
    ((and buffer-file-name (string-match "^/.*gilberte:" buffer-file-name) 'multi) 400 "Gilberte ssh (%d)")
    ((and buffer-file-name (string-match "^/.*albertine:" buffer-file-name) 'multi) 400 "Albertine ssh (%d)")
    ((and buffer-file-name (string-match "^/.*i19:" buffer-file-name) 'multi) 400 "i19 ssh (%d)")
    ((and buffer-file-name (string-match "^/.*anti1" buffer-file-name) 'multi) 400 "anti1 ssh (%d)")
    ((and buffer-file-name (string-match "^/Volumes/gilberte" buffer-file-name) 'multi) 400 "Gilberte expandrive (%d)")

    ((and (or (eq major-mode 'java-mode) (eq major-mode 'jde-mode)) 'multi) 1000 "Java (%d)")
    ((and (memq major-mode '(sh-mode)) 'multi) 1002 "Script (%d)")
    ((and (memq major-mode '(sql-mode)) 'multi) 1003 "SQL (%d)")
    ((and (eq major-mode 'm4-mode) 'multi) 1004 "m4 (%d)")

    ((and (eq major-mode 'tar-mode) 'multi) 250 "Tar (%d)")

    ((and (eq major-mode 'latex-mode) 'multi) 5010 "LaTeX (%d)")
    ((and (eq major-mode 'text-mode) 'multi) 5010 "Text (%d)")
    ((and buffer-file-name (string-match "README" buffer-file-name) 'multi) 5020 "README (%d)")
    ((and (eq major-mode 'Info-mode) 'multi) 5030 "Info (%d)")
    ((and (eq major-mode 'Man-mode) 'multi) 5030 "Manuals (%d)")
    ((and buffer-file-name (buffer-modified-p) 'multi) 10030 "Changed files (%d)")
    ((and (get-buffer-process (current-buffer)) 'multi) 10040 "Processes (%d)")
    ((and msb-display-invisible-buffers-p (msb-invisible-buffer-p) 'multi) 10090 "Invisible buffers (%d)")
    ((eq major-mode 'dired-mode) 15010 "Dired (%d)" msb-dired-item-handler msb-sort-by-directory)
    ((eq major-mode 'w3-mode) 40020 "WWW (%d)")


    ;; Catchup for all non-file buffers
    ((and (not buffer-file-name) 'no-multi) 40099 "Other non-file buffers (%d)")
    ((and (string-match "/\\.[^/]*$" buffer-file-name) 'multi) 30090 "Hidden Files (%d)")
    ('no-multi 30099 "Other files (%d)")
    ))

;----------------------------------------------------------------------

(defvar delete-buffers-list
  '("*Completions*" "*Help*" "*Buffer List*" "*vc*" "*Compile-Log*" "*inspect*"
    "*Directory*" "*Find Function*" "*ispell*" "*ispell choices*"
    "*cvs*" "*cvs-tmp*" "*cvs-commit-message*" "*cvs-commit*"
    "*svn*" "*svn-status*" "*svn-info*" "*svn-process*" "*svn-log-edit*" "*svn-info-output*"
    "*Occur*" "*Ediff Registry*" "*Ifconfig*" "*diction*"
    "*Whitespace Errors*" ".emacs.el"
    ".cvsignore" ".cvsignore<2>" ".cvsignore<3>" ".cvsignore<4>" ".cvsignore<5>" ".cvsignore<6>" ".cvsignore<7>" ".cvsignore<8>" ".cvsignore<9>"
    "*vc-dir*" "*Ibuffer*"
    "*magit: acmacs*" "*magit-process*"
    )
  "*List of buffers names that will be deleted by delete-temp-buffers")

(defun delete-temp-buffers ()
  "Deletes buffers listed in delete-buffers-list"
  (interactive)
  (let ((count 0) (len (length delete-buffers-list)))
    (while (< count len)
      (progn
    (if (get-buffer (nth count delete-buffers-list))
        (kill-buffer (nth count delete-buffers-list)))
    (setq count (1+ count))))))

;----------------------------------------------------------------------

(defun eu-buffer-menu ()
  (interactive)
  (bs-show)
  ;(buffer-menu)
  )

(defun eu-buffer-menu-files-only ()
  (interactive)
  (buffer-menu t))

;----------------------------------------------------------------------
; Toggle truncate lines
;----------------------------------------------------------------------

(defun eu-toggle-truncate-lines ()
  (interactive)
  (setq truncate-lines (not truncate-lines))
  (redraw-display))

(add-hook 'minibuffer-setup-hook '(lambda () (setq truncate-lines nil)))

;----------------------------------------------------------------------
; turn on auto-revert for remote files
;----------------------------------------------------------------------

;; (defun eu-auto-revert-remote-files ()
;;   (when buffer-file-name
;;     (if (string-match "^/\\(Volumes\\|Users/eu/x2\\)" buffer-file-name)
;;         (auto-revert-mode 1))))

;; (add-hook 'find-file-hook 'eu-auto-revert-remote-files)

;----------------------------------------------------------------------

;----------------------------------------------------------------------
;real- auto-save
;----------------------------------------------------------------------

(defun eu-turn-on-real-auto-save()
  (interactive)
  (let ((f (and (buffer-file-name) (file-truename (buffer-file-name)))))
    (if (and f (> (length f) 7) (string= (substring f 0 7) "/Users/"))
        (real-auto-save-mode))))

;(add-hook 'emacs-lisp-mode-hook 'eu-turn-on-real-auto-save)
;(add-hook 'python-mode-hook 'eu-turn-on-real-auto-save)
;(add-hook 'c++-mode-hook 'eu-turn-on-real-auto-save)
;(add-hook 'c-mode-hook 'eu-turn-on-real-auto-save)
;(add-hook 'sh-mode-hook 'eu-turn-on-real-auto-save)
;(add-hook 'js-mode-hook 'eu-turn-on-real-auto-save)
;(add-hook 'js2-mode-hook 'eu-turn-on-real-auto-save)
;(add-hook 'css-mode-hook 'eu-turn-on-real-auto-save)
;(add-hook 'text-mode-hook 'eu-turn-on-real-auto-save)

;----------------------------------------------------------------------
; Resize window
;----------------------------------------------------------------------

(defun eu-shrink-other-window-if-larger-than-buffer ()
  (interactive)
  (shrink-window-if-larger-than-buffer (next-window)))

;----------------------------------------------------------------------

(provide 'eu-buffers)

;----------------------------------------------------------------------
;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
