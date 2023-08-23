;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("b98ec4f494d915790c75439c02fc2f5ec4c0098e3965bd09b0aa0669225298ae" "7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf" "bbb13492a15c3258f29c21d251da1e62f1abb8bbd492386a673dcfab474186af" "c5a81a42df109b02a9a68dfe0ed530080372c1a0bbcb374da77ee3a57e1be719" default))
 '(global-auto-highlight-symbol-mode t)
 '(helm-candidate-number-limit 300)
 '(package-selected-packages
   '(highlight-indentation helm-ag gxref helm-xref spacemacs-theme auto-highlight-symbol helm-mt flycheck-pos-tip flycheck-color-mode-line flycheck eshell-git-prompt eshell-syntax-highlighting google-c-style evil-nerd-commenter git-gutter better-jumper company-shell json-mode vlf helm-gtags helm-etags-plus bash-completion srcery-theme magit dtrt-indent helm-projectile powerline-evil powerline evil-leader evil-collection ztree gnu-elpa company gnu-elpa-keyring-update)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; enable melpa
;; from melpa known issues
;;(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(require 'package)
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://www.mirrorservice.org/sites/melpa.org/packages/") t)
;; (add-to-list 'package-archives '("melpa-stable" . "http://www.mirrorservice.org/sites/stable.melpa.org/packages/") t)
(package-initialize)

;; personal settings and user-defined-functions
(add-to-list 'load-path "~/.emacs.d/configs/")
(require 'user-define-functions)
(require 'settings)
(require 'user-define-key-bindings)



;; init.el ends here
