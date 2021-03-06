;;
;; ----------------------------------------------------------------------

(defun eu-assign-key (key)
  (interactive "kShow current buffer using key: ")
  (if (or (not (global-key-binding key)) (y-or-n-p "Redefine that key? "))
      (progn
        (rename-buffer (format "%s <%s>" (buffer-name) (key-description key)))
        (let ((action (if (buffer-file-name)
                          `(lambda nil (interactive) (find-file ,(buffer-file-name)))
                        `(lambda nil (interactive) (switch-to-buffer ,(buffer-name))))))
                                        ;(prin1 action)
          (global-set-key key action)
          (message (format "Key assigned to %s" (or (buffer-file-name) (buffer-name))))))))

;; ======================================================================

(defun eu-project-root ()
  "Returns project root based on the current buffer file name"
  (let ((bfn (buffer-file-name)))
    (cond ((not bfn)
           (message "cannot infer directory from the current buffer file name") nil)
          ((string-match "/AD/" bfn)
           "~/AD/sources")
          ((string-match "/ac/acmacs/" bfn)
           "~/ac/acmacs")
          (t
            "~/"))))

;; ======================================================================

(defun eu--project-find-file (filename)
  `(lambda nil (interactive) (find-file ,filename)))

(defvar eu--project-root-dir)

(defun eu--project-make-filename (filename)
  (concat (file-name-as-directory eu--project-root-dir) filename))

;; (defun eukey (key)
;;   (interactive "kKey: ")
;;   (message (format "key: %s" (key-description key))))


;; ----------------------------------------------------------------------

(global-set-key (kbd "C-x p") (eu--project-find-file "/Users/eu/Shared/emacs/eu/eu-projects.el"))

;; ----------------------------------------------------------------------

(defun eu-project-marina ()
  (interactive)
  (global-set-key (kbd "A-i") (eu--project-find-file "~/Shared/experiments/marina.skepner.eu/index.html"))
  (global-set-key (kbd "A-c") (eu--project-find-file "~/Shared/experiments/marina.skepner.eu/main.css"))
  (global-set-key (kbd "A-j") (eu--project-find-file "~/Shared/experiments/marina.skepner.eu/main.js"))
  )

(defun eu-project-chart ()
  (interactive)
  (global-set-key (kbd "A-a") (eu--project-find-file "/Users/eu/AD/sources/acmacs-chart-2/cc/chart-grid-test.cc"))
  (global-set-key (kbd "A-c") (eu--project-find-file "/Users/eu/AD/sources/acmacs-chart-2/cc/chart.hh"))
  (global-set-key (kbd "A-m") (eu--project-find-file "/Users/eu/AD/sources/acmacs-chart-2/cc/chart-modify.hh"))
  (global-set-key (kbd "A-g") (eu--project-find-file "/Users/eu/AD/sources/acmacs-chart-2/cc/grid-test.hh"))
  )

(defun eu-project-acmacs-r ()
  (interactive)
  (global-set-key (kbd "A-a") (eu--project-find-file "/Users/eu/AD/sources/acmacs.r/src/acmacs.cpp"))
  )

(defun eu-project-seqdb ()
  (interactive)
  (setq eu--project-root-dir "~/AD/sources/seqdb")
  (global-set-key (kbd "A-M-m") (eu--project-find-file (eu--project-make-filename "Makefile")))

  (global-set-key (kbd "A-M-c") (eu--project-find-file (eu--project-make-filename "bin/seqdb-create")))
  (global-set-key (kbd "A-M-u") (eu--project-find-file (eu--project-make-filename "py/seqdb/update.py")))

  (global-set-key (kbd "A-C-s") (eu--project-find-file (eu--project-make-filename "cc/seqdb.cc")))
  (global-set-key (kbd "A-s")   (eu--project-find-file (eu--project-make-filename "cc/seqdb.hh")))
  (global-set-key (kbd "A-C-p") (eu--project-find-file (eu--project-make-filename "cc/seqdb-py.cc")))
  (global-set-key (kbd "A-C-e") (eu--project-find-file (eu--project-make-filename "cc/seqdb-export.cc")))
  (global-set-key (kbd "A-e")   (eu--project-find-file (eu--project-make-filename "cc/seqdb-export.hh")))

  (global-set-key (kbd "A-h")   (eu--project-find-file "~/AD/sources/hidb/cc/hidb.hh"))
  (global-set-key (kbd "A-C-h") (eu--project-find-file "~/AD/sources/hidb/cc/hidb.cc"))
  (global-set-key (kbd "A-c")   (eu--project-find-file "~/AD/sources/hidb/cc/chart.hh"))
  (global-set-key (kbd "A-C-c") (eu--project-find-file "~/AD/sources/hidb/cc/chart.cc"))
  )

;; ----------------------------------------------------------------------

(defun eu-project-hidb ()
  (interactive)
  (setq eu--project-root-dir "~/AD/sources/hidb")

  (global-set-key (kbd "A-l")   (eu--project-find-file "~/GH/locationdb/cc/locdb.hh"))
  (global-set-key (kbd "A-C-l") (eu--project-find-file "~/GH/locationdb/cc/locdb.cc"))
  (global-set-key (kbd "A-C-l") (eu--project-find-file "~/GH/locationdb/cc/locdb.cc"))
  (global-set-key (kbd "M-C-l") (eu--project-find-file "~/GH/locationdb/cc/py.cc"))
  (global-set-key (kbd "A-C-o") (eu--project-find-file "~/GH/locationdb/cc/export.cc"))

  (global-set-key (kbd "A-h")   (eu--project-find-file (eu--project-make-filename "src/hidb.hh")))
  (global-set-key (kbd "A-C-h") (eu--project-find-file (eu--project-make-filename "src/hidb.cc")))
  (global-set-key (kbd "M-A-h") (eu--project-find-file (eu--project-make-filename "src/hidb-py.cc")))
  (global-set-key (kbd "A-C-e") (eu--project-find-file (eu--project-make-filename "src/hidb-export.cc")))
  (global-set-key (kbd "A-c")   (eu--project-find-file (eu--project-make-filename "src/chart.hh")))
  (global-set-key (kbd "A-C-c") (eu--project-find-file (eu--project-make-filename "src/chart.cc")))

  (global-set-key (kbd "A-f")   (eu--project-find-file (eu--project-make-filename "bin/hidb-find")))
  )

;; ----------------------------------------------------------------------

(defun eu-project-ssm ()
  (interactive)
  (setq eu--project-root-dir "~/GH/ssm-report")
  (setq eu--project-ssm-root-dir "~/ac/results/ssm/2016-0926-ssm-sh-2016")
  (setq eu--project-previous-ssm-root-dir "~/ac/results/ssm/2016-0907-ssm-sh-2016-tc2")

  (global-set-key (kbd "A-C-r") (eu--project-find-file (eu--project-make-filename "README.md")))
  (global-set-key (kbd "A-m") (eu--project-find-file (eu--project-make-filename "python/ssm_report/maps.py")))
  (global-set-key (kbd "A-q") (eu--project-find-file (eu--project-make-filename "make-report")))
  (global-set-key (kbd "A-p") (eu--project-find-file (eu--project-make-filename "python/ssm_report/report.py")))
  (global-set-key (kbd "A-0") (eu--project-find-file (eu--project-make-filename "python/ssm_report/antigenic_maps.py")))
  (global-set-key (kbd "A-o") (eu--project-find-file (eu--project-make-filename "python/ssm_report/presentation.py")))
  (global-set-key (kbd "A-g") (eu--project-find-file (eu--project-make-filename "python/ssm_report/geographic.py")))
  (global-set-key (kbd "A-k") (eu--project-find-file (eu--project-make-filename "python/ssm_report/map_maker.py")))
  (global-set-key (kbd "A-s") (eu--project-find-file (eu--project-make-filename "python/ssm_report/settings.py")))
  (global-set-key (kbd "A-t") (eu--project-find-file (eu--project-make-filename "python/ssm_report/tree_maker.py")))
  (global-set-key (kbd "A-f") (eu--project-find-file (eu--project-make-filename "python/ssm_report/signature_page.py")))

  (global-set-key (kbd "A-a") (eu--project-find-file (concat (file-name-as-directory eu--project-ssm-root-dir) "settings.json")))
  (global-set-key (kbd "A-C-a") (eu--project-find-file (concat (file-name-as-directory eu--project-previous-ssm-root-dir) "settings.json")))

  (global-set-key (kbd "A-1") (eu--project-find-file (concat (file-name-as-directory eu--project-ssm-root-dir) "maps/trees/h1.json")))
  (global-set-key (kbd "A-3") (eu--project-find-file (concat (file-name-as-directory eu--project-ssm-root-dir) "maps/trees/h3.json")))
  (global-set-key (kbd "A-v") (eu--project-find-file (concat (file-name-as-directory eu--project-ssm-root-dir) "maps/trees/bvic.json")))
  (global-set-key (kbd "A-y") (eu--project-find-file (concat (file-name-as-directory eu--project-ssm-root-dir) "maps/trees/byam.json")))

  ;; (global-set-key (kbd "A-M-u") '(lambda nil (interactive) (async-shell-command "ssm-put")))
  ;; (global-set-key (kbd "A-M-v") '(lambda nil (interactive) (eu-compile-autoclose (concat "cd " eu--project-root-dir " && c2 ./B-report.py -vt"))))
  ;; (global-set-key (kbd "A-M-m") '(lambda nil (interactive) (eu-compile-autoclose "cd ~/ac/acmacs && c2 make -w -j$(nproc) acmacs")))
  )

;; ----------------------------------------------------------------------

(defun eu-project-amview ()
  (interactive)
  (setq eu--project-root-dir "~/Shared/AC/Projects/amview")
  (global-set-key (kbd "A-s")   (eu--project-find-file (eu--project-make-filename "surface.ts")))
  (global-set-key (kbd "A-m")   (eu--project-find-file (eu--project-make-filename "model.ts")))
  (global-set-key (kbd "A-v")   (eu--project-find-file (eu--project-make-filename "view.ts")))
  (global-set-key (kbd "A-b")   (eu--project-find-file (eu--project-make-filename "view-optimization-movie.ts")))
  (global-set-key (kbd "A-c")   (eu--project-find-file (eu--project-make-filename "controller.ts")))
  (global-set-key (kbd "A-t")   (eu--project-find-file (eu--project-make-filename "model-random.ts")))
  (global-set-key (kbd "A-d")   (eu--project-find-file (eu--project-make-filename "model-sdb.ts")))
  )

;; ----------------------------------------------------------------------

(defun eu-project-acmacs ()
  (interactive)
  (setq eu--project-root-dir "~/ac/acmacs")
  (global-set-key (kbd "A-c")   (eu--project-find-file (eu--project-make-filename "acmacs/core/chart.py")))
  )

;; ----------------------------------------------------------------------

(provide 'eu-projects)

;----------------------------------------------------------------------
;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
