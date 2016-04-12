(defun eu-assign-key (key)
  (interactive "kShow current buffer using key: ")
  (if (or (not (global-key-binding key)) (y-or-n-p "Redefine that key? "))
      (let ((action (if (buffer-file-name)
                        `(lambda nil (interactive) (find-file ,(buffer-file-name)))
                      `(lambda nil (interactive) (switch-to-buffer ,(buffer-name))))))
                                        ;(prin1 action)
        (global-set-key key action)
        (message (format "Key assigned to %s" (or (buffer-file-name) (buffer-name)))))))

(defun eu--project-find-file (filename)
  `(lambda nil (interactive) (find-file ,filename)))

(defvar eu--project-root-dir)

(defun eu--project-make-filename (filename)
  (concat (file-name-as-directory eu--project-root-dir) filename))

;; ----------------------------------------------------------------------

(defun eu-project-seqdb ()
  (interactive)
  (global-set-key (kbd "A-C-a") (eu--project-find-file "~/Shared/AC/Projects/seqdb/src/amino-acids.cc"))
  (global-set-key (kbd "A-M-a") (eu--project-find-file "~/Shared/AC/Projects/seqdb/src/amino-acids.hh"))
  (global-set-key (kbd "A-C-s") (eu--project-find-file "~/Shared/AC/Projects/seqdb/src/seqdb.cc"))
  (global-set-key (kbd "A-M-s") (eu--project-find-file "~/Shared/AC/Projects/seqdb/src/seqdb.hh"))
  (global-set-key (kbd "A-C-p") (eu--project-find-file "~/Shared/AC/Projects/seqdb/src/seqdb-py.cc"))
  )

;; ----------------------------------------------------------------------

(defun eu-project-ssm ()
  (interactive)
  (setq eu--project-root-dir "~/ac/results/ssm/2016-0229-hidb")
  (global-set-key (kbd "A-a") (eu--project-find-file (eu--project-make-filename "AA.py")))
  (global-set-key (kbd "A-b") (eu--project-find-file (eu--project-make-filename "B-report.py")))
  (global-set-key (kbd "A-M-u") '(lambda nil (interactive) (async-shell-command "ssm-put")))
  (global-set-key (kbd "A-M-v") '(lambda nil (interactive) (eu-compile-autoclose (concat "cd " eu--project-root-dir " && c2 ./B-report.py -vt"))))
  (global-set-key (kbd "A-M-m") '(lambda nil (interactive) (eu-compile-autoclose "cd ~/ac/acmacs && c2 make -w -j$(nproc) acmacs")))
  )

;; ----------------------------------------------------------------------

(provide 'eu-projects)

;----------------------------------------------------------------------
;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
