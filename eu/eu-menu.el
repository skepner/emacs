(cond (window-system

       ;; get rid of Buffers menu in the menu bar
       ;; (define-key global-map [menu-bar buffer] 'nil)

       (require 'eu-buch)

       (defun eu-add-submenu (menu)
         (easy-menu-define nil global-map "Eugene's menu" menu))

       (eu-add-submenu
        (append '("Eugene"
                  ["today" (find-file "~/D/org/today.org") t]
                  ["todo" (find-file "~/D/org/todo.org") t]
                  ["ceirs" (find-file "~/D/org/ceirs.org") t]
                  ["whocc" (find-file "~/D/org/whocc.org") t]
                  "-"
                  ["dtra" (find-file "~/Shared/AC/Projects/Nicola-DTRA/README" t) t]
                  )
                (list (append '("Buch") (eu-buch-make-menu)))
                '(
                  "-"
                  ("c2"
                   ["c2 make [app]" (eu-compile-push-history "cd ~/ac/acmacs && c2 make -w -j$(nproc)") t]
                   ["c2 make acmacs" (eu-compile-push-history "cd ~/ac/acmacs && c2 make -w -j$(nproc) acmacs") t]
                   ["c2 make core-bundle" (eu-compile-push-history "cd ~/ac/acmacs && c2 make -w -j$(nproc) acmacs-core-bundle") t]
                   ["c2 make core-dmg" (eu-compile-push-history "cd ~/ac/acmacs && c2 make -w -j$(nproc) acmacs-core-dmg") t]
                   ["c2 make clean all" (eu-compile-push-history "cd ~/ac/acmacs && c2 make clean all -j$(nproc)") t]
                   ["c2 make clean" (eu-compile-push-history "cd ~/ac/acmacs && c2 make clean") t]
                   ["c2 make test" (eu-compile-push-history "cd ~/ac/acmacs && c2 make test") t]
                   ["c2 make final" (eu-compile-push-history "cd ~/ac/acmacs && c2 make acmacs-web-final -w -j$(nproc)") t]
                   ["c2 make dmg" (eu-compile-push-history "cd ~/ac/acmacs && c2 make acmacs-web-image -w -j$(nproc)") t]
                   "-"
                   ["c2 git" (magit-status "~/ac/acmacs/") t]
                   )
                  ("AW"
                   ["list whocc" (eu-compile-push-history "aw -h albertine aw-chain.py list-whocc") t]
                   ["list users" (eu-compile-push-history "aw -h albertine aw-user.py list") t]
                   "-"
                   ["aw command samples (template)" (find-file "~/ac/acmacs/docs/template") t]
                   )
                  ("AD"
                   ["clean-all" (eu-compile-push-history "ad clean-all T=R") t]
                   ["make-all-no-test R" (eu-compile-push-history "ad make-all-no-test") t]
                   ["make-all-no-test D" (eu-compile-push-history "ad make-all-no-test DEBUG=1") t]
                   ["make-all R" (eu-compile-push-history "ad make-all TEST=1") t]
                   ["make-all D" (eu-compile-push-history "ad make-all TEST=1 DEBUG=1") t]
                   ["remake-all R" (eu-compile-push-history "ad remake-all TEST=1") t]
                   ["remake-all D" (eu-compile-push-history "ad remake-all TEST=1 DEBUG=1") t]
                   )
                  ("SSM"
                   ["SSM report preparation index" (find-file "/scp:i19:/syn/WebSites/Protected/eu/who-vcm/index.html") t]
                   ["SSM report index" (find-file "/scp:i19:/syn/WebSites/Protected/ssmreport/index.html") t]
                   ["SSM report preparation instructions" (find-file "~/AD/sources/ssm-report/doc/report-prepare.org") t]
                   "-"
                   ["edit information-list-vaccines" (find-file "~/ac/acmacs/acmacs-web/data/information-list-vaccines.pydata.bz2" t) t]
                   ["update on localhost and albertine" (eu-compile-push-history "~/ac/acmacs/scripts/acmacs-web-update-vaccines") t]
                   "-"
                   ["serum-circles" (find-file "~/ac/acmacs/acmacs/directories/serum_circles.py" t) t]
                   ;; ["update serum circles on localhost and albertine" (eu-compile-push-history "~/ac/acmacs/scripts/acmacs-web-update-vaccines ~/ac/acmacs/acmacs-web/data/information-list-serum-circles.pydata.bz2") t]
                   )

                  ;; ("acmacs-web-c2 log (localhost)"
                  ;;  ["acmacs-web.debug.log" (eu-tail-file "/Users/eu/AcmacsWeb/log/acmacs-web.debug.log") t]
                  ;;  ["acmacs-web.error.log" (eu-tail-file "/Users/eu/AcmacsWeb/log/acmacs-web.error.log") t]
                  ;;  ["cherokee.access" (eu-tail-file "/Users/eu/AcmacsWeb/log/cherokee.access") t]
                  ;;  ["cherokee.error" (eu-tail-file "/Users/eu/AcmacsWeb/log/cherokee.error") t]
                  ;;  ["mongod.log" (eu-tail-file "/Users/eu/AcmacsWeb/log/mongod.log") t]
                  ;;  ["stdout-stderr.log" (eu-tail-file "/Users/eu/AcmacsWeb/log/stdout-stderr.log") t]
                  ;;  ["uwsgi.log" (eu-tail-file "/Users/eu/AcmacsWeb/log/uwsgi.log") t]
                  ;;  ["wsgi-startup-error.log" (eu-tail-file "/Users/eu/AcmacsWeb/log/wsgi-startup-error.log") t]
                  ;;  )

                  ;;  ("buch"
                  ;; ["todo" (find-file "~/Google Drive/ASS/Eu/todo.txt" t) t]
                  ;; ("AC"
                  ;;  ["aw tunnel" (find-file "~/Shared/buch/ac/acmacs-web-tunnel-for-cdc.txt" t) t]
                  ;;  ["albertine-free-space" (find-file "~/Shared/buch/ac/albertine-free-space.txt" t) t]
                  ;;  ["beast" (find-file "~/Shared/buch/ac/beast.txt" t) t]
                  ;;  ["sequences-to-phylogenetic-tree" (find-file "~/Shared/buch/ac/sequences-to-phylogenetic-tree.md" t) t]
                  ;;  ["haskell" (find-file "~/Shared/buch/ac/haskell.txt" t) t]
                  ;;  )
                  ;; ("DE"
                  ;;  ["letters" (find-file "~/Shared/buch/de/letters.txt" t) t])
                  ;; ("Hund"
                  ;;  ["beneful" (find-file "~/Shared/buch/hund/korm-beneful.txt" t) t])
                  ;; ("Makondo"
                  ;;  ["MTel" (find-file "~/Shared/buch/makondo/mtel/mobile.txt" t) t]
                  ;;  ["Drulya" (find-file "~/Shared/buch/makondo/drulya.txt" t) t]
                  ;;  )
                  ;; ("OSX"
                  ;;  ["condor" (find-file "~/Shared/buch/osx/condor.txt" t) t]
                  ;;  ["delete-timemachine-backups" (find-file "~/Shared/buch/osx/delete-timemachine-backups.txt" t) t]
                  ;;  ["install-new" (find-file "~/Shared/buch/osx/install-new.md" t) t]
                  ;;  ["netstat-listen-port" (find-file "~/Shared/buch/osx/netstat-listen-port.txt" t) t]
                  ;;  ["windows-bootable-usb" (find-file "~/Shared/buch/osx/windows-bootable-usb.txt" t) t]
                  ;;  )
                  ;; ("Ubuntu"
                  ;;  ["adduser" (find-file "~/Shared/buch/ubuntu/adduser.md" t) t]
                  ;;  ["backup-users" (find-file "~/Shared/buch/ubuntu/backup-users.md" t) t]
                  ;;  ["haskell" (find-file "~/Shared/buch/ubuntu/haskell.txt" t) t]
                  ;;  ["packages" (find-file "~/Shared/buch/ubuntu/packages.md" t) t]
                  ;;  ["R" (find-file "~/Shared/buch/ubuntu/r.md" t) t]
                  ;;  )
                  ;; ["makondo-skepner.tex" (find-file "~/Google Drive/ASS/Makondo/invoices/makondo-skepner.tex" t) t]
                  ;; )
                  "-"
                  ("ac.org"
                   ["i19 apache ssl" (find-file "/scp:i19:/home/eu/Shared/System/Apache2/sites/notebooks.ac.org-ssl.conf") t]
                   ["i19 apache" (find-file "/scp:i19:/home/eu/Shared/System/Apache2/sites/notebooks.ac.org.conf") t]
                   ["i19 index page" (find-file "/scp:i19:/syn/WebSites/Protected/eu/index.html") t]
                   ["SSM report index" (find-file "/scp:i19:/syn/WebSites/Protected/ssmreport/index.html") t]
                   "-"
                   ["i19 eu index page" (find-file "/scp:eu@i19:/syn/WebSites/Protected/eu/index.html") t]
                   "-"
                   ["i19 acmacs-web-2 debug log" (find-file "/scp:eu@i19:/home/eu/AcmacsWeb/log/acmacs-web.debug.log") t]
                   "-"
                   ["odette nginx" (find-file "/scp:odette:/home/eu/Shared/System/Nginx/sites-available/default.public") t]
                   "-"
                   ["hidb-night-build log" (find-file "/scp:i19:/syn/eu/log/hidb4-night-build.log") t]
                   ["hidb5-update log" (find-file "/scp:i19:/syn/eu/log/whocc-hidb5-update.log") t]
                   ;; "-"
                   ;;  ["x12 apache ssl" (find-file "/scp:gilberte:/etc/apache2/sites/0000_any_443_acmacs-web.antigenic-cartography.org.conf") t]
                   ;; "-"
                   ;;  ["x12 full index page" (find-file "/scp:gilberte:www/index-full.html") t]
                   ;;  ["x12 index page" (find-file "/scp:gilberte:www/index.html") t]
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
                  )))
       ))

;----------------------------------------------------------------------

(provide 'eu-menu)

;----------------------------------------------------------------------
;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
