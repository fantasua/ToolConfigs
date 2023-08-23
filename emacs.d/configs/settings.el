;;; common settings
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(global-auto-revert-mode)
;; scrolling
(setq scroll-conservatively 101
      scroll-margin 0)

;; show matching bracket
(show-paren-mode 1)
;; show line number
(global-display-line-numbers-mode 1)

;; current line highlight
;;(global-hl-line-mode 1)

;; highlight but keep the original color theme
;(set-face-foreground 'highlight nil)
;(set-face-underline 'highlight nil)

;;; theme
;; load theme
(load-theme 'spacemacs-dark)

;; highlighting
;; disable highlight line when in visual mode
(add-hook 'evil-visual-state-entry-hook (lambda() (hl-line-mode -1)))
(add-hook 'evil-visual-state-exit-hook (lambda() (hl-line-mode +1)))


;;; code folding
;;set code folding
(add-hook 'prog-mode-hook 'my-code-modes)
;(add-hook 'python-mode-hook 'hs-minor-mode)
;(add-hook 'c-mode-common-hook 'hs-minor-mode)
;(add-hook 'c++-mode-hook 'hs-minor-mode)

;;; code formatting
;; open c/cpp header file in c++-mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; set default indent
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)

;; for ggtags mode
;;(add-hook 'c-mode-common-hook 'ggtags-mode)
;;(add-hook 'c++-mode-hook 'ggtags-mode)
;;(add-hook 'python-mode-hook 'ggtags-mode)


;; c/c++ code indent
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'c++-mode-hook 'google-set-c-style)
(add-hook 'c++-mode-hook 'google-make-newline-indent)
(setq c-default-style "linux"
      c-basic-offset 2)

;; treat underscore as part of a word
(add-hook 'python-mode-hook
          (lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'c-mode-common-hook
          (lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'c++-mode-hook
          (lambda () (modify-syntax-entry ?_ "w")))


;;; evil plugin settings
(require 'evil)
;; activate evil
(setq evil-want-keybinding nil)
(evil-mode 1)

;; evil-leader-key
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(setq evil-leader/in-all-states 1)

;; evil fold
(setq evil-fold-list
      `(((hs-minor-mode)
         :open-all hs-show-all
         :close-all hs-hidee-all
         :toggle hs-toggle-hiding
         :open hs-show-block
         :open-rec nil
         :close hs-hide-block)))


;;; company mode
;; enable company plugin
(global-company-mode 1)

;;; helm-projectile
(setq helm-ag-insert-at-point 'symbol)

;;; for imenu-list
;;; currently disabled imenu-list
;(imenu-list-minor-mode) ; do not bring imenu up on startup
;(setq imenu-list-position 'right)
;(setq imenu-list-size 0.2)

;;; for powerline
;;(require 'powerline)
(require 'powerline-evil)
(powerline-evil-vim-color-theme)

;;; for dtrt-indent
(require 'dtrt-indent)
(dtrt-indent-mode 1)


;;; for highlight-indentation
(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#e3e3d3")
(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")

;;; for projectile
(projectile-mode 1)
(projectile-discover-projects-in-directory ".")
(setq projectile-completion-system 'helm)

;;; open large files
(require 'vlf-setup)

;;; for git-gutter-plus
(global-git-gutter-mode 1)

;;; auto highlight symbol
(global-auto-highlight-symbol-mode t)

;; for gxref settings
;(add-to-list 'xref-backend-functions 'gxref-xref-backend)

;; for projectile indexing files
(setq projectile-enable-caching t)
(setq projectile-indexing-method 'hybrid projectile-enable-caching t)


;; settings for flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(require 'flycheck-color-mode-line)
(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

;; delete trailing whitesapce when saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'whitespace-cleanup)


;;; eshell
;; eshell syntex highlight
(add-hook 'eshell-mode-hook 'eshell-syntax-highlighting-mode)

;; eshell git prompt
(eshell-git-prompt-use-theme 'powerline)


(provide 'settings)

;;; settings.el ends here
