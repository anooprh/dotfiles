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
