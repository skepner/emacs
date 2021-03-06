(defvar eu-buch-root "~/Shared/buch/")

(defvar eu-buch-exclude '("." ".." ".git" ".gitignore" ".DS_Store"))

;; ----------------------------------------------------------------------

(defun eu-buch-make-menu ()
  (let* ((list-subdirs-or-files (function (lambda (dir subdirs)
                                   (let ((result '()))
                                     (dolist (filename (directory-files dir t) result)
                                       (if (and (not (member (file-name-nondirectory filename) eu-buch-exclude)) (apply (if subdirs 'identity 'not) (list (file-directory-p filename))))
                                           (setq result (append result (list filename)))))))))
         (make-file-entry (function (lambda (filename)
                                      (vector (file-name-nondirectory filename) (list 'find-file filename t) t))))
         (make-dir-entry (function (lambda (dir)
                                      (append (list (file-name-nondirectory dir)) (funcall process-dir dir)))))
         (process-dir (function (lambda (dir)
                                  (append (mapcar make-dir-entry (funcall list-subdirs-or-files dir t)) (mapcar make-file-entry (funcall list-subdirs-or-files dir nil)))))))
    (funcall process-dir eu-buch-root)))

;; ----------------------------------------------------------------------

(provide 'eu-buch)

;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
