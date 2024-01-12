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
   '("046a2b81d13afddae309930ef85d458c4f5d278a69448e5a5261a5c78598e012" "a5270d86fac30303c5910be7403467662d7601b821af2ff0c4eb181153ebfc0a" "98ef36d4487bf5e816f89b1b1240d45755ec382c7029302f36ca6626faf44bbd" "ba323a013c25b355eb9a0550541573d535831c557674c8d59b9ac6aa720c21d3" "871b064b53235facde040f6bdfa28d03d9f4b966d8ce28fb1725313731a2bcc8" "7b8f5bbdc7c316ee62f271acf6bcd0e0b8a272fdffe908f8c920b0ba34871d98" "b98ec4f494d915790c75439c02fc2f5ec4c0098e3965bd09b0aa0669225298ae" "7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf" "bbb13492a15c3258f29c21d251da1e62f1abb8bbd492386a673dcfab474186af" "c5a81a42df109b02a9a68dfe0ed530080372c1a0bbcb374da77ee3a57e1be719" default))
 '(global-auto-highlight-symbol-mode t)
 '(helm-candidate-number-limit 300)
 '(package-selected-packages
   '(highlight-indent-guides vterm ggtags magit gruvbox-theme helm-ag gxref helm-xref spacemacs-theme auto-highlight-symbol flycheck-pos-tip flycheck-color-mode-line flycheck eshell-git-prompt eshell-syntax-highlighting google-c-style evil-nerd-commenter git-gutter better-jumper company-shell json-mode vlf helm-gtags helm-etags-plus bash-completion srcery-theme dtrt-indent helm-projectile powerline-evil powerline evil-leader evil-collection ztree gnu-elpa company gnu-elpa-keyring-update)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(which-func ((t (:foreground "yellow")))))

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
;; user defined-functions
;; open config file
(defun open-config-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; emacs mode which is commonly used
(defun my-code-modes ()
  (hs-minor-mode)
  ;; highlight current line
  (hl-line-mode)
  (which-function-mode)
  ;; highlight-indent-guide
  (highlight-indent-guides-mode 1)
  (set-variable 'highlight-indent-guides-method 'character)
  (set-variable 'highlight-indent-guides-auto-enabled 'nil)
  (set-face-foreground 'highlight-indent-guides-character-face "dimgray")
  )

;; use define settings
;;; common settings
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(global-auto-revert-mode)
;; show line number
(global-display-line-numbers-mode 1)

;; scrolling
(setq scroll-conservatively 101
      scroll-margin 0)
;; turn off auto save
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq backup-by-copying t)
(setq create-lockfiles nil)

;; show matching bracket
(show-paren-mode 1)

;; current line highlight
;;(global-hl-line-mode 1)

;; highlight but keep the original color theme
;(set-face-foreground 'highlight nil)
;(set-face-underline 'highlight nil)

;;; theme
;; load theme
(load-theme 'gruvbox)

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
;; (add-hook 'c-mode-common-hook 'ggtags-mode)
;; (add-hook 'c++-mode-hook 'ggtags-mode)
;; (add-hook 'python-mode-hook 'ggtags-mode)

;; for indent guideline


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
(add-to-list 'xref-backend-functions 'gxref-xref-backend)

;; for projectile indexing files
(setq projectile-enable-caching t)
(setq projectile-indexing-method 'hybrid projectile-enable-caching t)


;; settings for flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-checker-error-threshold 10000)
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

;; user defined key-bindings
;; bind key<F2> to open config file
(global-set-key (kbd "<f2>") 'open-config-file)

;; bind key<F5> to update gtags
(global-set-key (kbd "<f5>") 'projectile-regenerate-tags)

;; for helm plugins
(global-set-key (kbd "M-x") 'helm-M-x)

;; for evil-nerd-commenter
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)

;;; using evil-leader key binding
;; open buffer menu
(require 'evil-leader)
(evil-leader/set-key
  "b" 'helm-buffers-list)
;; open projectile-ag search
(evil-leader/set-key
  "s" 'helm-projectile-ag)
;; open helm-projectile to find file
(evil-leader/set-key
  "f" 'helm-projectile-find-file-dwim)
;; open imenu-list
(evil-leader/set-key
  "o" 'helm-semantic-or-imenu)

;; open magit
;(evil-leader/set-key
;  "g" 'magit)
;; open magit-status
(evil-leader/set-key
  "gs" 'magit-status)
;; open magit-log
(evil-leader/set-key
  "gl" 'magit-log)
;; when editing commit message in magit

;; key-binding for finding rtags
;(require 'helm-gtags)
;(with-eval-after-load 'evil-maps
;  (define-key evil-motion-state-map (kbd "C-[") 'helm-gtags-find-rtag))

;; for vterm
(defun open-vterm-in-new-tab ()
  (interactive)
  (other-tab-prefix)
  (vterm)
)
;; bound to evil leader
(require 'evil-leader)
(require 'vterm)
(evil-leader/set-key
  "t" 'open-vterm-in-new-tab)


;; for better-jumper
;(require 'better-jumper)
;(with-eval-after-load 'evil-maps
;  (define-key evil-motion-state-map (kbd "C-o") 'better-jumper-jump-backward)
;  (define-key evil-motion-state-map (kbd "C-i") 'better-jumper-jump-forward))

;; for helm-mt, which is a helm for terminal emulator
;(require 'helm-mt)
;(evil-leader/set-key
;  "t" 'helm-mt)
;; now using eshell
;;(evil-leader/set-key
;;  "t" 'eshell)

;; init.el ends here
