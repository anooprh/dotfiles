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
(defun duplicate-line (arg)
  "Duplicate current line, leaving point in lower line."
  (interactive "*p")

  ;; save the point for undo
  (setq buffer-undo-list (cons (point) buffer-undo-list))

  ;; local variables for start and end of line
  (let ((bol (save-excursion (beginning-of-line) (point)))
        eol)
    (save-excursion

      ;; don't use forward-line for this, because you would have
      ;; to check whether you are at the end of the buffer
      (end-of-line)
      (setq eol (point))

      ;; store the line and disable the recording of undo information
      (let ((line (buffer-substring bol eol))
            (buffer-undo-list t)
            (count arg))
        ;; insert the line arg times
        (while (> count 0)
          (newline)         ;; because there is no newline in 'line'
          (insert line)
          (setq count (1- count)))
        )

      ;; create the undo information
      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list)))
    ) ; end-of-let

  ;; put the point in the lowest line and return
  (next-line arg))
(global-set-key (kbd "C-d") 'duplicate-line)

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

;; Set Title bar to show the name of the full path of the file which is open
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

