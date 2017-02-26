(cond ((equal (system-name) "jagd")

       ;; ----------------------------------------------------------------------

       (autoload 'wl "wl" "Wanderlust" t)

       (autoload 'wl-user-agent-compose "wl-draft" nil t)
       (if (boundp 'mail-user-agent)
           (setq mail-user-agent 'wl-user-agent))
       (if (fboundp 'define-mail-user-agent)
           (define-mail-user-agent
             'wl-user-agent
             'wl-user-agent-compose
             'wl-draft-send
             'wl-draft-kill
             'mail-send-hook))

       ;; ----------------------------------------------------------------------
       ;; gmail
       ;; ----------------------------------------------------------------------

       (setq elmo-imap4-default-server "imap.gmail.com"
             elmo-imap4-default-user "eu.skepner@skepner.eu"
             elmo-imap4-default-authenticate-type 'clear
             elmo-imap4-default-port '993
             elmo-imap4-default-stream-type 'ssl

             ;; For non ascii-characters in folder-names
             elmo-imap4-use-modified-utf7 t)

       (setq wl-from "Eugene Skepner <eu.skepner@skepner.eu>"

             ;; All system folders (draft, trash, spam, etc) are placed in the
             ;; [Gmail]-folder, except inbox. "%" means it's an IMAP-folder
             wl-default-folder "%inbox"
             wl-draft-folder   "%[Gmail]/Drafts"
             wl-trash-folder   "%[Gmail]/Trash"
             ;; The below is not necessary when you send mail through Gmail's SMTP server,
             ;; see https://support.google.com/mail/answer/78892?hl=en&rd=1
             wl-fcc            "%[Gmail]/Sent"

             ;; Mark sent messages as read (sent messages get sent back to you and
             ;; placed in the folder specified by wl-fcc)
             wl-fcc-force-as-read    t

             ;; For auto-completing foldernames
             wl-default-spec "%")


       ;; ----------------------------------------------------------------------
       ;; ----------------------------------------------------------------------


       (autoload 'wl-user-agent-compose "wl-draft" nil t)
       (if (boundp 'mail-user-agent)
           (setq mail-user-agent 'wl-user-agent))
       (if (fboundp 'define-mail-user-agent)
           (define-mail-user-agent
             'wl-user-agent
             'wl-user-agent-compose
             'wl-draft-send
             'wl-draft-kill
             'mail-send-hook))

       ;; ----------------------------------------------------------------------

))

;; ----------------------------------------------------------------------

(provide 'eu-mail)

;; ----------------------------------------------------------------------
;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
