;----------------------------------------------------------------------
; helm
;; ----------------------------------------------------------------------

(global-set-key [f4] 'helm-mini)
(global-set-key [C-f4] 'helm-imenu)
(global-set-key [M-f4] 'helm-resume)
(global-set-key (kbd "C-M-i") 'helm-semantic-or-imenu)
(define-key python-mode-map (kbd "C-M-i") 'helm-semantic-or-imenu)
(global-set-key (kbd "C-M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-M-f") 'helm-find-files)
(global-set-key (kbd "C-M-l") 'helm-locate)
(global-set-key (kbd "C-M-o") 'helm-occur)
(global-set-key (kbd "C-M-p") 'helm-projectile)
;(global-set-key [S-f4] 'helm-projectile)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-h b") 'helm-descbinds)
(global-set-key (kbd "C-h m") 'helm-describe-modes)
(global-set-key (kbd "C-M-,") 'helm-etags-select)
(define-key minibuffer-local-map (kbd "C-M-h") 'helm-minibuffer-history)

(add-to-list 'dash-at-point-mode-alist '(perl-mode . "perl"))

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

(provide 'eu-helm)

;----------------------------------------------------------------------
;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
