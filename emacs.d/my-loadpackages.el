; ~/.emacs.d/my-loadpackages.el
; loading package
(load "~/.emacs.d/my-packages.el")

;; This file is for making custom modifications to an of the package I install
(elscreen-start)

;; Auto complete setup
(require 'auto-complete-config)
(ac-config-default)
