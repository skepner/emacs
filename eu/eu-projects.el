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

(defun eu-project-seqdb ()
  (interactive)
  (global-set-key (kbd "A-C-a") (eu--project-find-file "~/Shared/AC/Projects/seqdb/src/amino-acids.cc"))
  (global-set-key (kbd "A-M-a") (eu--project-find-file "~/Shared/AC/Projects/seqdb/src/amino-acids.hh"))
  (global-set-key (kbd "A-C-s") (eu--project-find-file "~/Shared/AC/Projects/seqdb/src/seqdb.cc"))
  (global-set-key (kbd "A-M-s") (eu--project-find-file "~/Shared/AC/Projects/seqdb/src/seqdb.hh"))
  (global-set-key (kbd "A-C-p") (eu--project-find-file "~/Shared/AC/Projects/seqdb/src/seqdb-py.cc"))
  )

(defun eu-project-ssm ()
  (interactive)
  (global-set-key (kbd "A-a") (eu--project-find-file "~/ac/results/ssm/2016-0229-hidb/AA.py"))
  (global-set-key (kbd "A-b") (eu--project-find-file "~/ac/results/ssm/2016-0229-hidb/B-report.py"))
  (global-set-key (kbd "A-M-u") '(lambda nil (interactive) (async-shell-command "ssm-put")))
  )

(provide 'eu-projects)

;----------------------------------------------------------------------
;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
