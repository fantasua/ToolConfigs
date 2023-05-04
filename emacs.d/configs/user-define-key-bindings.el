;; bind key<F2> to open config file
(global-set-key (kbd "<f2>") 'open-config-file)

;; for helm plugins
(global-set-key (kbd "M-x") 'helm-M-x)

;; for evil-nerd-commenter
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)

;;; using evil-leader key binding
;; open buffer menu
(evil-leader/set-key
  "b" 'buffer-menu)
;; open projectile-ag search
(evil-leader/set-key
  "s" 'helm-projectile-ag)
;; open helm-projectile to find file
(evil-leader/set-key
  "o" 'helm-projectile-find-file-dwim)
;; open magit-status
(evil-leader/set-key
  "gs" 'magit-status)
;; for better-jumper
(require 'better-jumper)
(with-eval-after-load 'evil-maps
  (define-key evil-motion-state-map (kbd "C-o") 'better-jumper-jump-backward)
  (define-key evil-motion-state-map (kbd "<C-i>") 'better-jumper-jump-forward))

;; for helm-mt, which is a helm for terminal emulator
(require 'helm-mt)
(evil-leader/set-key
  "t" 'helm-mt)

(provide 'user-define-key-bindings)
