(defvar eu-buch-root "~/Shared/buch/")

(defvar eu-buch-exclude '("." ".." ".git" ".gitignore" ".DS_Store"))

(defun eu-buch-make-menu-old ()
  (let ((top-dirs
         (let ((result '()))
           (dolist (filename (directory-files eu-buch-root t) result)
             (if (and (not (member (file-name-nondirectory filename) '("." ".." ".git"))) (file-directory-p filename))
                 (setq result (append result (list filename)))))))
        (menu)
        (entries-in (function (lambda (dir)
                                (let ((r '()))
                                  (dolist (filename (directory-files dir t) r)
                                    (if (and (not (file-directory-p filename)) (not (member (file-name-nondirectory filename) '(".DS_Store"))))
                                        (setq r (append r (list (vector (file-name-nondirectory filename) (list 'find-file filename t) t))))))))))
        )
    (dolist (top-dir top-dirs menu)
      (setq menu (append menu (list (append (list (file-name-nondirectory top-dir)) (funcall entries-in top-dir))))))
    (prin1 menu)))

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
                                  (append (mapcar make-dir-entry (funcall list-subdirs-or-files dir t)) (mapcar make-file-entry (funcall list-subdirs-or-files dir nil))))))
         (menu (funcall process-dir eu-buch-root)))
    menu))

;; ----------------------------------------------------------------------

(provide 'eu-buch)

;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
