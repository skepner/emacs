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

(provide 'eu-ac)

;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
