(global-set-key [?\A-\C-\M-c] '(lambda nil (interactive) (find-file "~/Shared/AC/ceirs.org")))
(global-set-key [?\A-\C-\M-z] '(lambda nil (interactive) (find-file "~/Shared/AC/todo.org")))
; (global-set-key [?\A-\M-z] '(lambda nil (interactive) (find-file "/Users/eu/Shared/AC/todo.txt")))

(global-set-key [?\A-\C-\M-r] '(lambda nil (interactive) (find-file "~/ac/acmacs/docs/template")))

(global-set-key [?\A-\C-\M-w] '(lambda nil (interactive) (eu-compile-push-history "aw -h albertine aw-chain.py list-whocc")))

;; ----------------------------------------------------------------------

;; (global-set-key [?\A-\M-r] '(lambda nil (interactive) (find-file "/Users/eu/Shared/AC/rd-links.txt")))
;; (global-set-key [?\A-\M-i] '(lambda nil (interactive) (find-file "/Users/eu/ac/acmacs-b/b3/bin/who-index-page-generator.py")))

;; (global-set-key (kbd "A-m") '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs-web/yui/acmacs/js/cherry-map.js")))
;; (global-set-key [?\A-c] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs-web/yui/acmacs/js/cherry-chart.js")))
;; (global-set-key [?\A-h] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs-web/yui/acmacs/js/cherry-chain.js")))
;; (global-set-key [?\A-i] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs-web/yui/acmacs/js/cherry-inspector.js")))
;; (global-set-key [?\A-e] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs-web/yui/acmacs/js/cherry-extensions.js")))
;; (global-set-key [?\A-a] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs-web/yui/acmacs/js/cherry-application.js")))
;; (global-set-key [?\A-t] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs-web/yui/acmacs/js/cherry-text.js")))
;; (global-set-key [?\A-s] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs-web/yui/acmacs/js/cherry-chart-selector.js")))

;; (global-set-key [?\A-\M-c] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs/mongodb_collections/chart.py")))

;; (global-set-key [?\A-b] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs-web/static/brazil/brazil.coffee")))
;; (global-set-key [?\A-n] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs-web/static/brazil/brazil.less")))

;; (global-set-key [?\A-3] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs-web/static/brazil/canvas-3d.coffee")))

;; (global-set-key [?\C-\M-m] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs/core/markings.py")))
;; (global-set-key [?\A-\M-m] '(lambda nil (interactive) (find-file "~/ac/acmacs/acmacs-web/yui/acmacs/js/cherry-markings.js")))

;; ----------------------------------------------------------------------

(global-set-key [?\C-\A-\M-a] 'eu-antigen-serum)

;; ----------------------------------------------------------------------

(defun eu-rename-buffer ()
  (let ((under-acmacs (cdr (member "acmacs" (split-string (buffer-file-name) "/")))))
    (if under-acmacs
        (rename-buffer (mapconcat 'identity (reverse under-acmacs) " ")))))

;----------------------------------------------------------------------

(defun eu-antigen-serum-replacement (src)
  (let ((src_lower (downcase src)))
    (cond ((string= src_lower "antigens") (concat "sera"))
          ((string= src_lower "antigen") (concat "serum"))
          ((string= src_lower "ag") (concat "sr"))
          ((string= src_lower "sera") (concat "antigens"))
          ((string= src_lower "serum") (concat "antigen"))
          ((string= src_lower "sr") (concat "ag")))))

;; (defun eu-antigen-serum2 ()
;;   (interactive)
;;   (if (re-search-forward "\\(antigens\\|antigen\\|ag\\|serum\\|sera\\|sr\\)")
;;       (replace-match (eu-antigen-serum-replacement (match-string 0)))))

(defun eu-antigen-serum-replacements (data count)
  ;(message (match-string 0))
  (eu-antigen-serum-replacement (match-string 0)))

(defun eu-antigen-serum ()
  (interactive)
  (perform-replace "\\(antigens\\|antigen\\|ag\\|serum\\|sera\\|sr\\)" '(eu-antigen-serum-replacements . t) t t nil))

;----------------------------------------------------------------------

(defun who-release ()
  (interactive)
  (call-interactively 'mail)
  (erase-buffer)
  (insert "From: Eugene Skepner <eu@antigenic-cartography.org>
To: who-cc-hi-data-updated@antigenic-cartography.org
Subject: WHO CC HI data
--text follows this line--
The new HI table and antigenic map website:

https://acmacs-web.antigenic-cartography.org/whocc/

updated with links to the following HI tables and routine diagnostics for them:



For removal/addition to this list, email to cc-data@antigenic-cartography.org

----------------------------

New HI table and antigenic map website usage instructions:

Please enter your regular username and password that you use to view
the old antigenic cartography website. Upon logging in please wait few
seconds before list of tables appear, it may take longer in the time
before the teleconferences and vaccine choosing meeting when our
servers process a lot of maps and could be quite busy.

At the top of the page, right under Acmacs logo, appear four tab
labels corresponding to the flu subtypes and lineages processed by
AcmacsWeb: A(H1N1)2009pdm, A(H3N2), B/Vic, B/Yam. Clicking the label
switches the tab and list of tables shown within the tab.

You may open time series tab by clicking the Time series link at the
top. Please wait few seconds before maps appear.

You may open routine diagnostics tab for a table by clicking on the
table name. You may resize each map by dragging the bottom right
corner of it. Moving mouse close to the top of a map shows toolbar
with few commands available for that map, e.g. showing/hiding labels,
reducing/enlarging labels and points, downloading pdf for the map,
showing/hiding error lines (for individual table maps only),
downloading table and map data in various formats.

Eugene Skepner
Antigenic Cartography
")
  (goto-char 336)
  )

;; ----------------------------------------------------------------------

(defun who-table (l tt tables)
  (interactive (list
                (completing-read "Lab: " '("cdc" "cnic" "melb" "niid" "nimr" "CDC" "CNIC" "MELB" "NIID" "NIMR") nil t)
                (completing-read "Subtype: " '("h1pdm" "h3" "bv" "by" "H1PDM" "H3" "BV" "BY") nil t)
                (read-string "Tables: ")))
  (let ((lab (upcase l))
        (subtype (cdr (assoc (downcase tt) '(("h1pdm" . "A(H1N1pdm)") ("h3" . "A(H3N2)") ("bv" . "B/Vic") ("by" . "B/Yam"))))))
    (call-interactively 'mail)
    (erase-buffer)
    (insert "From: Eugene Skepner <eu@antigenic-cartography.org>\nTo: hacking@antigenic-cartography.org\n")
    (insert "Subject: " lab " " subtype " " tables "\n")
    (insert "--text follows this line--\n")
    (insert lab " " subtype " " tables "\n\nhttps://acmacs-web.antigenic-cartography.org/whocc-full/\n\nEu\n")
    (goto-char (+ 130 (length lab) (length subtype) (length tables)))
    ))

;; ----------------------------------------------------------------------

(defun eu-keys-find-file (filename)
  `(lambda nil (interactive) (find-file ,filename)))

(defun eu-keys-amv ()
  (interactive)
  (global-set-key [?\A-1] (eu-keys-find-file "/Users/eu/ac/antigenic-map-viewer-v2/amv-level1.ts"))
  (global-set-key [?\A-2] (eu-keys-find-file "/Users/eu/ac/antigenic-map-viewer-v2/amv-2d.ts"))
  (global-set-key [?\A-3] (eu-keys-find-file "/Users/eu/ac/antigenic-map-viewer-v2/amv-3d.ts"))
  (global-set-key [?\A-4] (eu-keys-find-file "/Users/eu/ac/antigenic-map-viewer-v2/test-4d.ts"))
  (global-set-key [?\A-d] (eu-keys-find-file "/Users/eu/ac/antigenic-map-viewer-v2/antigenic-map-viewer.d.ts"))
  (global-set-key [?\A-0] (eu-keys-find-file "/Users/eu/ac/antigenic-map-viewer-v2/amv.ts"))
  (global-set-key [?\A-\C-1] (eu-keys-find-file "/Users/eu/ac/antigenic-map-viewer-v2/amv-level2.ts"))
  (global-set-key [?\A-\C-2] (eu-keys-find-file "/Users/eu/ac/antigenic-map-viewer-v2/amv-manipulator-2d.ts"))
  (global-set-key [?\A-\C-3] (eu-keys-find-file "/Users/eu/ac/antigenic-map-viewer-v2/amv-manipulator-3d.ts"))
  )

;; ----------------------------------------------------------------------

(provide 'eu-ac)

;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
