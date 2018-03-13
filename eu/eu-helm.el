;----------------------------------------------------------------------
; helm
;; ----------------------------------------------------------------------

(require 'helm-swoop)

(global-set-key [f4] 'helm-mini)
(global-set-key [C-f4] 'helm-imenu)
(global-set-key [M-f4] 'helm-resume)
(global-set-key (kbd "C-M-i") 'helm-semantic-or-imenu)
(define-key python-mode-map (kbd "C-M-i") 'helm-semantic-or-imenu)
(global-set-key (kbd "C-M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-M-f") 'helm-find-files)
(global-set-key (kbd "C-M-l") 'helm-locate)
(global-set-key (kbd "C-M-m") 'helm-man-woman)
(global-set-key (kbd "C-M-o") 'helm-occur)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-h a") 'helm-apropos)
(global-set-key (kbd "C-h c") 'helm-colors)
(global-set-key (kbd "C-h b") 'helm-descbinds)
(global-set-key (kbd "C-h m") 'helm-describe-modes)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-h t") 'helm-top)
(global-set-key (kbd "C-h x") 'helm-register)
(global-set-key (kbd "C-M-,") 'helm-etags-select)
(global-set-key (kbd "C-M-s") 'helm-swoop)
(define-key minibuffer-local-map (kbd "C-M-h") 'helm-minibuffer-history)

(global-set-key (kbd "C-M-p") '(lambda nil (interactive) (helm-find-files-1 "~/D/org")))

(add-to-list 'dash-at-point-mode-alist '(perl-mode . "perl"))

; grep
(global-set-key [f3] '(lambda () (interactive) (helm-do-ag (file-name-directory (buffer-file-name)))))
(global-set-key [A-f3] '(lambda () (interactive) (let ((current-prefix-arg '(4))) (call-interactively 'helm-do-ag))))
;(global-set-key [M-f3] '(lambda () (interactive) (helm-ag (file-name-directory (buffer-file-name)))))
(global-set-key (kbd "C-M-b") 'helm-do-ag-buffers)
(define-key helm-map [f3] 'helm-follow-mode)
(global-set-key [M-f3] '(lambda () (interactive) (helm-do-ag (eu-project-root))))

; find
(global-set-key (kbd "C-M-s") '(lambda nil (interactive) (helm-find-1 (eu-project-root))))

; AD
;(global-set-key (kbd "C-M-s") '(lambda nil (interactive) (helm-find-1 "~/AD/sources")))
(global-set-key [M-f3] '(lambda () (interactive) (helm-do-ag "~/AD/sources")))

; acmacs-c
(global-set-key (kbd "C-M-a") '(lambda nil (interactive) (helm-find-1 "~/ac/acmacs")))

;; ----------------------------------------------------------------------

(defun shk-yas/helm-prompt (prompt choices &optional display-fn)
    "Use helm to select a snippet. Put this into `yas-prompt-functions.'"
    (interactive)
    (setq display-fn (or display-fn 'identity))
    (if (require 'helm-config)
        (let (tmpsource cands result rmap)
          (setq cands (mapcar (lambda (x) (funcall display-fn x)) choices))
          (setq rmap (mapcar (lambda (x) (cons (funcall display-fn x) x)) choices))
          (setq tmpsource
                (list
                 (cons 'name prompt)
                 (cons 'candidates cands)
                 '(action . (("Expand" . (lambda (selection) selection))))
                 ))
          (setq result (helm-other-buffer '(tmpsource) "*helm-select-yasnippet"))
          (if (null result)
              (signal 'quit "user quit!")
            (cdr (assoc result rmap))))
      nil))

;; ----------------------------------------------------------------------

;; https://www.reddit.com/r/emacs/comments/376won/select_helm_candidate_by_using_mouse_click/
;; https://www.reddit.com/r/emacs/comments/5sv6xa/select_helm_candidate_by_using_mouse_click/

;; (defun helm-select-candidate-by-mouse (prefix event)
;;   "Select helm candidate by using mouse(click).  With PREFIX, also execute its first action."
;;   (interactive "P\ne")
;;   (if (helm-alive-p)
;;       (progn
;;         (with-helm-buffer
;;           (let* ((posn (elt event 1))
;;                  (cursor (line-number-at-pos (point)))
;;                  (pointer (line-number-at-pos (posn-point posn))))
;;             (helm--next-or-previous-line (if (> pointer cursor)
;;                                              'next
;;                                            'previous)
;;                                          (abs (- pointer cursor)))))
;;         (when prefix (helm-maybe-exit-minibuffer)))
;;     (mouse-drag-region event)))

;; (define-key helm-map (kbd "<down-mouse-1>") 'helm-select-candidate-by-mouse)
;; (define-key helm-map (kbd "<mouse-1>") 'ignore)

;; ----------------------------------------------------------------------

(provide 'eu-helm)

;----------------------------------------------------------------------
;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
