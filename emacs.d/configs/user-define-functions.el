;; open config file
(defun open-config-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; emacs mode which is commonly used
(defun my-code-modes ()
  (hs-minor-mode)
  (hl-line-mode))

(provide 'user-define-functions)
;;; user-define-functions ends here
