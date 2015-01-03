; ~/.emacs.d/init.el

(add-hook 'after-init-hook '(lambda ()
  (load "~/.emacs.d/my-noexternals.el")
))

(load "~/.emacs.d/my-loadpackages.el")

;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes (quote ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(ede-project-directories (quote ("/home/anoop/Workspace/SPOJ"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
