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

;; open c/cpp header file in c++-mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))


;; enable melpa
;; from melpa known issues
;;(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(require 'package)
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://www.mirrorservice.org/sites/melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://www.mirrorservice.org/sites/stable.melpa.org/packages/") t)
(package-initialize)

;; for plugin settings
;; enable company plugin
(global-company-mode 1)


;; activate evil
(setq evil-want-keybinding nil)
(require 'evil)
(evil-mode 1)
;; evil-leader-key
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(setq evil-leader/in-all-states 1)

;; for powerline
(require 'powerline)
(powerline-evil-vim-color-theme)

;; for helm plugins
(global-set-key (kbd "M-x") 'helm-M-x)

;; for dtrt-indent
(require 'dtrt-indent)
(dtrt-indent-mode 1)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c5a81a42df109b02a9a68dfe0ed530080372c1a0bbcb374da77ee3a57e1be719" default)))
 '(package-selected-packages
   (quote
    (magit dtrt-indent helm-projectile powerline-evil powerline evil-leader evil-collection evil ztree gnu-elpa company gnu-elpa-keyring-update))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
