(cond (window-system

       ;; get rid of Buffers menu in the menu bar
       ;; (define-key global-map [menu-bar buffer] 'nil)

       (defun eu-add-submenu (menu)
         (easy-menu-define nil global-map "Eugene's menu" menu))

       (eu-add-submenu
        '("Eugene"
           ("c2"
            ["c2 make [app]" (compile "cd ~/ac/acmacs && c2 make -j$(nproc)" nil) t]
            ["c2 make acmacs" (compile "cd ~/ac/acmacs && c2 make -j$(nproc) acmacs" nil) t]
            ["c2 make clean all" (compile "cd ~/ac/acmacs && c2 make clean all -j$(nproc)" nil) t]
            ["c2 make clean" (compile "cd ~/ac/acmacs && c2 make clean" nil) t]
            ["c2 make test" (compile "cd ~/ac/acmacs && c2 make test" nil) t]
            ["c2 make final" (compile "cd ~/ac/acmacs && c2 make acmacs-web-final -j$(nproc)" nil) t]
            ["c2 make dmg" (compile "cd ~/ac/acmacs && c2 make acmacs-web-image -j$(nproc)" nil) t]
            "-"
            ["c2 git" (magit-status "~/ac/acmacs/") t]
            )

           ;("aw albertine"
            ["list-whocc" (compile "aw -h albertine aw-chain.py list-whocc") t]
           ; )
            ["dtra" (find-file "~/Shared/AC/Projects/Nicola-DTRA/README" t) t]

           ("acmacs-web-c2"
            ["acmacs-web.debug.log" (eu-tail-file "/Users/eu/AcmacsWeb/log/acmacs-web.debug.log") t]
            ["acmacs-web.error.log" (eu-tail-file "/Users/eu/AcmacsWeb/log/acmacs-web.error.log") t]
            ["cherokee.access" (eu-tail-file "/Users/eu/AcmacsWeb/log/cherokee.access") t]
            ["cherokee.error" (eu-tail-file "/Users/eu/AcmacsWeb/log/cherokee.error") t]
            ["mongod.log" (eu-tail-file "/Users/eu/AcmacsWeb/log/mongod.log") t]
            ["stdout-stderr.log" (eu-tail-file "/Users/eu/AcmacsWeb/log/stdout-stderr.log") t]
            ["uwsgi.log" (eu-tail-file "/Users/eu/AcmacsWeb/log/uwsgi.log") t]
            ["wsgi-startup-error.log" (eu-tail-file "/Users/eu/AcmacsWeb/log/wsgi-startup-error.log") t]
            )
           "-"
           ["mds svn" (svn-status "~/ac/mds/trunk") t]

           "-"
           ("Buch"
            ["MTel" (find-file "~/Shared/buch/makondo/mtel/mobile.txt" t) t]
            )
           "-"
           ("ac.org"
            ["i19 apache ssl" (find-file "/scp:i19:/home/eu/Shared/System/Apache2/sites/notebooks.ac.org-ssl.conf") t]
            ["i19 apache" (find-file "/scp:i19:/home/eu/Shared/System/Apache2/sites/notebooks.ac.org.conf") t]
           "-"
           ["i19 acmacs-web-2 debug log" (find-file "/scp:eu@i19:/home/eu/AcmacsWeb/log/acmacs-web.debug.log") t]
           "-"
            ["odette nginx" (find-file "/scp:odette:/home/eu/Shared/System/Nginx/sites-available/default.public") t]
           "-"
            ["x12 apache ssl" (find-file "/scp:gilberte:/etc/apache2/sites/0000_any_443_acmacs-web.antigenic-cartography.org.conf") t]
           "-"
            ["x12 full index page" (find-file "/scp:gilberte:www/index-full.html") t]
            ["x12 index page" (find-file "/scp:gilberte:www/index.html") t]
            )
           "-"
           ("Logs"
            ["system.log" (eu-tail-file "/var/log/system.log") t]
            )
          ("RC"
           [".bashrc" (find-file "~/.bashrc") t]
           [".bash_profile" (find-file "~/.bash_profile") t]
           ["httpd.conf" (find-file "/etc/apache2/httpd.conf") t]
           )

          ("emacs"
           ["Save Desktop" (desktop-save "~/") t]
           "-"
           ;;      ["Toggle blank visualization" (call-interactively 'blank-mode) t]
           ;["Convert number from one radix to another" (call-interactively 'number-to-number) t]
           ;["Insert lines numbers" (eu-insert-line-numbers (region-beginning) (region-end)) t]
           ;["Toggle ascii code display" (ascii-display) t]
           ["Sort chars of region" (sort-regexp-fields nil "." "." (region-beginning) (region-end)) t]
           ;["Display a list of Emacs Lisp files that shadow other files" (call-interactively 'list-load-path-shadows) t]
                                        ;["Remove all trailing whitespace in the buffer" (nuke-trailing-whitespace) t]
           ;"-"
           ;; ["gnuplot mode" (gnuplot-make-buffer) t]
           ;; ["Ghostview region" (eu-ghostview-region (region-beginning) (region-end)) (< (region-beginning) (region-end))]
           )
          ))
       ))

;----------------------------------------------------------------------

(provide 'eu-menu)

;----------------------------------------------------------------------
;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
