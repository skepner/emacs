(if (not (string-match "/eu/bin" (getenv "PATH")))
    (let ((home (getenv "HOME")))
      (setenv "PATH" (concat home "/bin:" home "/.cabal/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"))))

;----------------------------------------------------------------------

(setenv "TIME" "<Time %E>")

;----------------------------------------------------------------------

(provide 'eu-env)

;;; Local Variables:
;;; eval: (add-hook 'after-save-hook 'byte-compile-this-file nil t)
;;; End:
