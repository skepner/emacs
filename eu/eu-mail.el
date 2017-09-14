(cond ((equal (system-name) "jagd")

       ;; ----------------------------------------------------------------------

       (add-hook 'mail-mode-hook 'mail-abbrevs-setup)
       (add-hook 'mail-mode-hook 'flyspell-mode)
       (mail-abbrevs-mode)

       (defun eu-mailrc-updated ()
         (interactive)
         (setq mail-abbrevs nil)
         (setq mail-aliases nil))

       (defun eu-mail ()
         (interactive)
         (mail)
         (let ((mail-save-dir "/r/mail"))
           (if (not (file-accessible-directory-p mail-save-dir))
               (make-directory mail-save-dir))
           (write-file (make-temp-file (concat mail-save-dir "/" (format-time-string "%Y-%m%d-%H%M%S") ".")))))

       (global-set-key (kbd "A-C-M-S-m") 'eu-mail)

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
