;;
;; ----------------------------------------------------------------------

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

(global-set-key (kbd "C-x p") (eu--project-find-file "/Users/eu/Shared/emacs/eu/eu-projects.el"))

;; ----------------------------------------------------------------------

(defun eu-project-seqdb ()
  (interactive)
  (setq eu--project-root-dir "~/GH/seqdb")
  (global-set-key (kbd "A-C-a") (eu--project-find-file (eu--project-make-filename "src/amino-acids.cc")))
  (global-set-key (kbd "A-a")   (eu--project-find-file (eu--project-make-filename "src/amino-acids.hh")))
  (global-set-key (kbd "A-C-s") (eu--project-find-file (eu--project-make-filename "src/seqdb.cc")))
  (global-set-key (kbd "A-s")   (eu--project-find-file (eu--project-make-filename "src/seqdb.hh")))
  ;; (global-set-key (kbd "A-C-j")   (eu--project-find-file (eu--project-make-filename "src/seqdb-json.cc")))
  ;; (global-set-key (kbd "A-j")   (eu--project-find-file (eu--project-make-filename "src/json-read.hh")))
  (global-set-key (kbd "A-C-p") (eu--project-find-file (eu--project-make-filename "src/seqdb-py.cc")))
  (global-set-key (kbd "A-M-u") (eu--project-find-file (eu--project-make-filename "python/seqdb/update.py")))
  (global-set-key (kbd "A-M-h") (eu--project-find-file (eu--project-make-filename "python/seqdb/hidb.py")))
  (global-set-key (kbd "A-C-t") (eu--project-find-file (eu--project-make-filename "src/tree.cc")))
  (global-set-key (kbd "A-t")   (eu--project-find-file (eu--project-make-filename "src/tree.hh")))
  (global-set-key (kbd "M-C-t") (eu--project-find-file (eu--project-make-filename "bin/whocc-make-tree")))
  (global-set-key (kbd "A-M-m") (eu--project-find-file (eu--project-make-filename "python/seqdb/make_tree.py")))
  (global-set-key (kbd "A-C-d") (eu--project-find-file (eu--project-make-filename "src/draw.cc")))
  (global-set-key (kbd "A-d")   (eu--project-find-file (eu--project-make-filename "src/draw.hh")))
  (global-set-key (kbd "A-C-S-d")   (eu--project-find-file (eu--project-make-filename "bin/tree-draw")))
  (global-set-key (kbd "A-C-f") (eu--project-find-file (eu--project-make-filename "src/draw-tree.cc")))
  (global-set-key (kbd "A-f")   (eu--project-find-file (eu--project-make-filename "src/draw-tree.hh")))
  (global-set-key (kbd "A-C-g") (eu--project-find-file (eu--project-make-filename "src/signature-page.cc")))
  (global-set-key (kbd "A-g")   (eu--project-find-file (eu--project-make-filename "src/signature-page.hh")))
  (global-set-key (kbd "A-C-h") (eu--project-find-file (eu--project-make-filename "src/time-series.cc")))
  (global-set-key (kbd "A-h")   (eu--project-find-file (eu--project-make-filename "src/time-series.hh")))
  (global-set-key (kbd "A-C-k") (eu--project-find-file (eu--project-make-filename "src/draw-clades.cc")))
  (global-set-key (kbd "A-k")   (eu--project-find-file (eu--project-make-filename "src/draw-clades.hh")))
  (global-set-key (kbd "A-C-l") (eu--project-find-file (eu--project-make-filename "src/settings.cc")))
  (global-set-key (kbd "A-l")   (eu--project-find-file (eu--project-make-filename "src/settings.hh")))
  (global-set-key (kbd "A-C-n") (eu--project-find-file (eu--project-make-filename "src/antigenic-maps.cc")))
  (global-set-key (kbd "A-n")   (eu--project-find-file (eu--project-make-filename "src/antigenic-maps.hh")))
  (global-set-key (kbd "A-C-b") (eu--project-find-file (eu--project-make-filename "src/chart.cc")))
  (global-set-key (kbd "A-b")   (eu--project-find-file (eu--project-make-filename "src/chart.hh")))
  )

;; ----------------------------------------------------------------------

(defun eu-project-ssm ()
  (interactive)
  ; (setq eu--project-root-dir "~/ac/results/ssm/2016-0229-hidb")
  (setq eu--project-root-dir "~/GH/ssm-report")
  (global-set-key (kbd "A-C-r") (eu--project-find-file (eu--project-make-filename "README.md")))
  ;; (global-set-key (kbd "A-a") (eu--project-find-file (eu--project-make-filename "AA.py")))
  ;; (global-set-key (kbd "A-b") (eu--project-find-file (eu--project-make-filename "B-report.py")))
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
