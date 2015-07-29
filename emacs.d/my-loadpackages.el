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

;; Projectile config --> This does not work yet, need to figure out why??
(require 'projectile)
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'grizzl)'
(projectile-global-mode)

;; Bind Alt Shift Up/Down to move regions of text up and down
(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg)
          (when (and (eval-when-compile
                       '(and (>= emacs-major-version 24)
                             (>= emacs-minor-version 3)))
                     (< arg 0))
            (forward-line -1)))
        (forward-line -1))
      (move-to-column column t)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))
(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

(global-set-key [M-S-up] 'move-text-up)
(global-set-key [M-S-down] 'move-text-down)
