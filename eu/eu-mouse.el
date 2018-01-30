;----------------------------------------------------------------------
; Mouse support
;----------------------------------------------------------------------

(defun eu-nope ()
  (interactive))

; MagicMouse
(global-set-key [down-mouse-3] 'msb) ; right click
(define-key compilation-mode-map [down-mouse-3] 'msb)

(global-set-key [A-down-mouse-1] 'mouse-popup-menubar-stuff) ; single finger swipe right
(global-set-key [A-drag-mouse-1] 'eu-nope)
(global-set-key [A-mouse-1] 'eu-nope)
(global-set-key [A-up-mouse-1] 'eu-nope)

(global-set-key [M-down-mouse-1] 'imenu) ; single finger swipe left
(global-set-key [M-drag-mouse-1] 'eu-nope)
(global-set-key [M-mouse-1] 'eu-nope)
(global-set-key [M-up-mouse-1] 'eu-nope)

(global-set-key [down-mouse-8] 'imenu) ; logitech t400

; disable wheel for magic mouse
(global-set-key [wheel-up] 'eu-nope)
;(global-set-key [wheel-down] 'eu-nope)
(global-set-key [wheel-left] 'forward-sexp)
(global-set-key [wheel-right] 'backward-sexp)

(global-set-key [mouse-2] 'mouse-yank-at-click)

;; ; paste by middle-click, BTT bug (20101220)
;; (global-set-key [C-mouse-1] 'mouse-yank-at-click)
;; (global-set-key [C-down-mouse-1] 'eu-nope)
;; (global-set-key [C-drag-mouse-1] 'eu-nope)
;; (global-set-key [C-up-mouse-1] 'eu-nope)

;; ----------------------------------------------------------------------
; wheel
;; ----------------------------------------------------------------------

(defun eu-wheel-down () (interactive) (if (not (one-window-p)) (scroll-other-window 1)))
(defun eu-wheel-up () (interactive) (if (not (one-window-p)) (scroll-other-window -1)))

(global-set-key [wheel-down] 'eu-wheel-down)
(global-set-key [wheel-up] 'eu-wheel-up)

;----------------------------------------------------------------------

(provide 'eu-mouse)

;----------------------------------------------------------------------
;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
