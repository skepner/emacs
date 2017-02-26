;; -*- Emacs-Lisp -*-
;; You should set this variable if you use multiple e-mail addresses.
(setq wl-user-mail-address-list (quote ("eu.skepner@skepner.eu" "eu@antigenic-cartography.org")))

;;(NOTE: "M-: wl-draft-parent-folder" => %INBOX:myname/clear@imap.gmail.com:993)
(setq wl-draft-config-alist
      '(((string-match "antigenic-cartography.org" wl-draft-parent-folder)
         (template . "work"))
        ((string-match "skepner.eu" wl-draft-parent-folder)
         (template . "eu"))
        ;; automatic for replies
        (reply "\\(To\\|Cc\\|Delivered-To\\): .*antigenic-cartography.org.*"
         (template . "work"))
        (reply "\\(To\\|Cc\\|Delivered-To\\): .*skepner.eu.*"
         (template . "eu"))))

;;choose template with C-c C-j
(setq wl-template-alist
      '(("eu"
         (wl-from . "Eugene Skepner <eu.skepner@skepner.eu>")
         (wl-smtp-posting-user . "Eugene Skepner")
         (wl-smtp-posting-server . "localhost")
         (wl-smtp-authenticate-type ."plain")
         (wl-local-domain . "skepner.eu")
         (wl-message-id-domain . "skepner.eu"))
        ("work"
         (wl-from . "Eugene Skepner <eu@antigenic-cartography.org>")
         (wl-smtp-posting-server . "localhost")
         (wl-local-domain . "skepner.eu"))
         ("From" . wl-from)))

;; ----------------------------------------------------------------------

(add-hook
 'mime-view-mode-hook
 '(lambda ()
    ;; Key bindings
    (local-set-key [?v] 'mime-preview-toggle-content)
    ))

;; ----------------------------------------------------------------------

(global-set-key [A-M-return] '(lambda () (interactive) (switch-to-buffer "Summary")))

; "%n%T%P%M/%D(%W)%h:%m %t%[%17(%c %f%) %] %s"
(setq wl-folder-summary-line-format-alist
      '(("^%" . "%T%P %M/%D(%W) %h:%m %t %[%17(%f %c%) %] %-5S %s")
        ))

(setq wl-summary-width nil)
(setq wl-auto-save-drafts-interval 10)

;; ----------------------------------------------------------------------
