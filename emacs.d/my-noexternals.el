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

; easily move arround windows wiht shift  + arrow key
(windmove-default-keybindings)
(setq windmove-wrap-around t)

; function and shortcut (C-d) to duplicate the current line
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key (kbd "C-S-d") 'duplicate-line)

(defun comment-or-uncomment-region-or-line()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)
    )
)
(global-set-key (kbd "C-/") 'comment-or-uncomment-region-or-line)