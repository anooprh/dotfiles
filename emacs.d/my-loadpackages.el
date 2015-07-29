; ~/.emacs.d/my-loadpackages.el
; loading package
(load "~/.emacs.d/my-packages.el")

;; This file is for making custom modifications to an of the package I install
(elscreen-start)

;; Auto complete setup
(require 'auto-complete-config)
(ac-config-default)

;; Ctrl W feature of intelliJ, apparently called Expand Region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)      ;;Expand region with ctrl =
(global-set-key (kbd "C-+") 'er/contract-region)  ;;Contract with ctrl shift =

;; Projectile config
(require 'projectile)
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'grizzl)'
(projectile-global-mode)
