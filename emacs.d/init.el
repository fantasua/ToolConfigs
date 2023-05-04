;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

(add-to-list 'load-path "~/.emacs.d/configs/")

;; this should be move to another file to keep files organized
;; activate evil
(setq evil-want-keybinding nil)
(require 'evil)
(evil-mode 1)
;; evil-leader-key
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(setq evil-leader/in-all-states 1)


(require 'user-define-functions)
(require 'user-define-key-bindings)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf" "bbb13492a15c3258f29c21d251da1e62f1abb8bbd492386a673dcfab474186af" "c5a81a42df109b02a9a68dfe0ed530080372c1a0bbcb374da77ee3a57e1be719" default))
 '(global-auto-highlight-symbol-mode t)
 '(helm-candidate-number-limit 300)
 '(package-selected-packages
   '(helm-ag gxref helm-xref spacemacs-theme auto-highlight-symbol helm-mt flycheck-pos-tip flycheck-color-mode-line flycheck eshell-git-prompt eshell-syntax-highlighting google-c-style evil-nerd-commenter git-gutter better-jumper company-shell json-mode vlf helm-gtags helm-etags-plus bash-completion srcery-theme magit dtrt-indent helm-projectile powerline-evil powerline evil-leader evil-collection ztree gnu-elpa company gnu-elpa-keyring-update)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; some common settings
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
;; show matching bracket
(show-paren-mode 1)
;; show line number
(global-display-line-numbers-mode 1)
;; current line highlight
;;(global-hl-line-mode 1)
;; highlight but keep the original color theme
;(set-face-foreground 'highlight nil)
;(set-face-underline 'highlight nil)
;; load theme
(load-theme 'spacemacs-dark 1)

;; open c/cpp header file in c++-mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; emacs mode which is commonly used
(defun common-modes ()
  (hs-minor-mode)
  (hl-line-mode))

;;set code folding
(add-hook 'prog-mode-hook 'common-modes)
(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
;; using evil fold
(setq evil-fold-list
      `(((hs-minor-mode)
         :open-all hs-show-all
         :close-all hs-hidee-all
         :toggle hs-toggle-hiding
         :open hs-show-block
         :open-rec nil
         :close hs-hide-block)))

;; disable highlight line when in visual mode
(add-hook 'evil-visual-state-entry-hook (lambda() (hl-line-mode -1)))
(add-hook 'evil-visual-state-exit-hook (lambda() (hl-line-mode +1)))

;; treat underscore as part of a word
(add-hook 'python-mode-hook
          (lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'c-mode-common-hook
          (lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'c++-mode-hook
          (lambda () (modify-syntax-entry ?_ "w")))

;; settings for flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(require 'flycheck-color-mode-line)
(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

;; delete trailing whitesapce when saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'whitespace-cleanup)

;; set default indent
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; c/c++ code indent
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'c++-mode-hook 'google-set-c-style)
(add-hook 'c++-mode-hook 'google-make-newline-indent)
(setq c-default-style "linux"
      c-basic-offset 2)

;;eshell syntex highlight
(add-hook 'eshell-mode-hook 'eshell-syntax-highlighting-mode)
;;eshell git prompt
(eshell-git-prompt-use-theme 'powerline)

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

;; for plugin settings
;; enable company plugin
(global-company-mode 1)


;; helm-projectile
(setq helm-ag-insert-at-point 'symbol)

;; for powerline
;;(require 'powerline)
(require 'powerline-evil)
(powerline-evil-vim-color-theme)

;; for dtrt-indent
(require 'dtrt-indent)
(dtrt-indent-mode 1)

;; for projectile
(projectile-mode 1)
(projectile-discover-projects-in-directory ".")
(setq projectile-completion-system 'helm)

;; for open large files
(require 'vlf-setup)

;; for git-gutter-plus
(global-git-gutter-mode 1)

;; auto highlight symbol
(global-auto-highlight-symbol-mode t)

;; for gxref settings
;(add-to-list 'xref-backend-functions 'gxref-xref-backend)

;; for projectile indexing files
(setq projectile-enable-caching t)
(setq projectile-indexing-method 'hybrid projectile-enable-caching t)

;; init.el ends here
