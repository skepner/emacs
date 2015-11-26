(setq user-mail-address "eu.skepner@skepner.eu"
      user-full-name "Eugene Skepner")

(setq gnus-select-method '(nnimap "gmail"
                                  (nnimap-address "imap.gmail.com")  ; it could also be imap.googlemail.com if that's your server.
                                  (nnimap-server-port "imaps")
                                  (nnimap-stream ssl)))

;; Make Gnus NOT ignore [Gmail] mailboxes
(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

(setq gnus-fetch-old-headers t)

;; (require 'nnir)
;; (nnir-search-engine imap)

(setq gnus-thread-sort-functions
      '((not gnus-thread-sort-by-date)
        (not gnus-thread-sort-by-number)))

(setq gnus-use-cache t)

;; Tree view for groups.
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; Threads!
(setq gnus-summary-thread-gathering-function 'gnus-gather-threads-by-subject)

(setq gnus-parameters
      '(("nnimap.*"
         (gnus-use-scoring nil)
         (expiry-wait . 2)
         (display . all))))

(setq gnus-permanently-visible-groups "INBOX")

(setq-default
 gnus-summary-line-format "%U%R%z %(%&user-date; | %-15,15f  %B%s%)\n"
 gnus-user-date-format-alist '((t . "%Y-%m-%d %H:%M"))
 gnus-summary-thread-gathering-function 'gnus-gather-threads-by-references
 gnus-thread-sort-functions '(gnus-thread-sort-by-date))

(when window-system
  (setq gnus-sum-thread-tree-indent "  ")
  (setq gnus-sum-thread-tree-root "● ")
  (setq gnus-sum-thread-tree-false-root "◯ ")
  (setq gnus-sum-thread-tree-single-indent "◎ ")
  (setq gnus-sum-thread-tree-vertical        "│")
  (setq gnus-sum-thread-tree-leaf-with-other "├─► ")
  (setq gnus-sum-thread-tree-single-leaf     "╰─► "))
