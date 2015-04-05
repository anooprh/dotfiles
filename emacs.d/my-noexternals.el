; ~/.emacs.d/my-noexternals.el

;disable backup
(setq backup-inhibited t)
(setq make-backup-files nil)

;disable auto save
(setq auto-save-default nil)

;enable auto-refreshing of all buffers
(global-auto-revert-mode t)

;disable all sounds
(setq visible-bell 1)

;Enable edo mode by default
(require 'ido)
(ido-mode t)

;Tab indentation
(setq tab-width 2
      indent-tabs-mode nil)

;y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;set column numbers
(setq column-number-mode t)

;set line numbers
(global-linum-mode 1)
(setq linum-format " %d ")

;set font size
(set-face-attribute 'default nil :height 100)

;diable toolbar
(tool-bar-mode -1)
