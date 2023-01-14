
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; some common settings
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(global-linum-mode 1)


;; open config file
(defun open-config-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; bind key<F2> to open config file
(global-set-key (kbd "<f2>") 'open-config-file)


;; enable melpa
;; from melpa known issues
;;(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(require 'package)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://mirrors.cloud.tencent.com/elpa/melpa/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://mirrors.cloud.tencent.com/elpa/melpa-stable/") t)
(package-initialize)

;; for plugin settings
;; enable company plugin
(global-company-mode 1)
;; for company-ctags
(with-eval-after-load 'company
  (company-ctags-auto-setup))

;; activate evil
(setq evil-want-keybinding nil)
(require 'evil)
(evil-mode 1)

;; for ctags-update
(ctags-global-auto-update-mode)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-ctags ctags-update evil-leader evil-collection evil ztree gnu-elpa ## company gnu-elpa-keyring-update))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
