;; -*- Emacs-Lisp -*-

(setq wl-from "Eugene Skepner <eu@antigenic-cartography.org>" ; "Eugene Skepner <eu.skepner@skepner.eu>"

             ;; All system folders (draft, trash, spam, etc) are placed in the
             ;; [Gmail]-folder, except inbox. "%" means it's an IMAP-folder
             wl-default-folder "%inbox"
             wl-draft-folder   "%[Gmail]/Drafts"
             wl-trash-folder   "%[Gmail]/Trash"
             ;; The below is not necessary when you send mail through Gmail's SMTP server,
             ;; see https://support.google.com/mail/answer/78892?hl=en&rd=1
             wl-fcc            "%[Gmail]/Sent Mail"

             ;; Mark sent messages as read (sent messages get sent back to you and
             ;; placed in the folder specified by wl-fcc)
             wl-fcc-force-as-read    t

             ;; For auto-completing foldernames
             wl-default-spec "%")

;; ----------------------------------------------------------------------

(add-hook
 'mime-view-mode-hook
 '(lambda ()
    ;; Key bindings
    (local-set-key [?v] 'mime-preview-toggle-content)
    (local-set-key [?m] 'wl-summary-toggle-mime-buttons)
    ))

;; ----------------------------------------------------------------------

(global-set-key [A-M-return] '(lambda () (interactive) (switch-to-buffer "Summary")))

(define-key wl-summary-mode-map (kbd "A") 'wl-summary-reply)
(define-key wl-summary-mode-map (kbd "a") 'wl-summary-reply-with-citation)

; "%n%T%P%M/%D(%W)%h:%m %t%[%17(%c %f%) %] %s"
(setq wl-folder-summary-line-format-alist
      '(("^%" . "%T%P %M/%D(%W) %h:%m %t %[%17(%f %c%) %] %-5S %s")
        ))

(setq wl-summary-width nil)
(setq wl-auto-save-drafts-interval 10)
(setq wl-interactive-send nil)
(setq wl-ask-range nil)

(setq wl-message-ignored-field-list '("^.*:"))

(setq wl-message-visible-field-list
'("^To:"
  "^Cc:"
  "^From:"
  "^Subject:"
  "^Date:"
  "^Reply-To:"))

;; ;; ----------------------------------------------------------------------

; https://github.com/dholm/dotemacs/blob/master/.emacs.d/lisp/apps/wanderlust.el
(defun wl-summary-overview-entity-compare-by-reply-date (a b)
  "Compare message A and B by latest date of replies including thread."
  (flet ((string-max2 (x y)
          (cond ((string< x y) y)
                ('t x)))
         (thread-number-get-date (x)
          (timezone-make-date-sortable (elmo-msgdb-overview-entity-get-date
                                        (elmo-message-entity
                                         wl-summary-buffer-elmo-folder x))))
         (thread-get-family (x)
          (cons x (wl-thread-entity-get-descendant (wl-thread-get-entity x))))
         (max-reply-date (x)
          (cond ((eq 'nil x)
                 'nil)
                ((eq 'nil (cdr x))
                 (thread-number-get-date (car x)))
                ('t
                 (string-max2 (thread-number-get-date (car x))
                              (max-reply-date (cdr x)))))))
    (string<
     (max-reply-date (thread-get-family (elmo-message-entity-number a)))
     (max-reply-date (thread-get-family (elmo-message-entity-number b))))))

;; ----------------------------------------------------------------------
;; ;; You should set this variable if you use multiple e-mail addresses.
;; ; (setq wl-user-mail-address-list (quote ("eu.skepner@skepner.eu" "eu@antigenic-cartography.org")))

;; ;;(NOTE: "M-: wl-draft-parent-folder" => %INBOX:myname/clear@imap.gmail.com:993)
;; (setq wl-draft-config-alist
;;       '(((string-match "antigenic-cartography.org" wl-draft-parent-folder)
;;          (template . "work"))
;;         ((string-match "skepner.eu" wl-draft-parent-folder)
;;          (template . "eu"))
;;         ;; automatic for replies
;;         (reply "\\(To\\|Cc\\|Delivered-To\\): .*antigenic-cartography.org.*"
;;          (template . "work"))
;;         (reply "\\(To\\|Cc\\|Delivered-To\\): .*skepner.eu.*"
;;          (template . "eu"))))

;; ;;choose template with C-c C-j
;; (setq wl-template-alist
;;       '(("eu"
;;          (wl-from . "Eugene Skepner <eu.skepner@skepner.eu>")
;;          (wl-smtp-posting-user . "Eugene Skepner")
;;          (wl-smtp-posting-server . "localhost")
;;          (wl-smtp-authenticate-type ."plain")
;;          (wl-local-domain . "skepner.eu")
;;          (wl-message-id-domain . "skepner.eu"))
;;         ("work"
;;          (wl-from . "Eugene Skepner <eu@antigenic-cartography.org>")
;;          (wl-smtp-posting-server . "localhost")
;;          (wl-local-domain . "skepner.eu"))
;;          ("From" . wl-from)))

;; ----------------------------------------------------------------------
