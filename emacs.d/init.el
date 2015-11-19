;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; Anoop's .emacs.d/init.el file
;;;; v 0.1
;;;; 10/24/2015

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Initializing Package Archives
(require 'cl)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; List of required packages
(defvar required-packages
  '(
    solarized-theme
    sr-speedbar
    elscreen
    expand-region
    hideshowvis
    gh-md  ; Markdown viewer from github realtime
    markdown-mode
    diff-hl
    magit
    smooth-scrolling
    cmake-mode
    helm
    flycheck
    projectile
    helm-projectile
    direx
    dired+
    ggtags
    ;;    yasnippet
    ;;    solarized-theme
    ;;    chess
    ;;    auto-complete
    ;;    jedi
    ;;    pyde
    ;;    pyimpsort
    ;;    pymacs
    ;;    pysmell
    ;;    python
    ;;    python-cell
    ;;    ac-python
    ;;    anaconda-mode
    ;;    ein
    ;;    elpy
    ;;    ipython
    ;;    dired+
    ;;    transpose-frame
    ;;    python-mode
    ;;    expand-region
    ;;    projectile
    ;;    move-text
    ;;    helm
    ;;    neotree
    ) "a list of packages to ensure are installed at launch.")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Method to check if all packages are installed
(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

;; If not all packages are installed, check one by one and install the missing ones.
(unless (packages-installed-p)
  ;; Check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; Install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set the Theme- All the below themes are good
(load-theme 'tango t)
;;(load-theme 'whiteboard t)
;;(load-theme 'leuven t)
;;(load-theme 'misterioso t)
;;(load-theme 'tango-dark t)
;;(load-theme 'wheatgrass t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Propmt y or n instead of yes or no
(defalias 'yes-or-no-p 'y-or-n-p)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Open Emacs in Full screen mode always
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Customizing the cursor
(setq-default cursor-type 'bar)
;; (set-cursor-color "#ffffff") 
;; Visit https://color.adobe.com/ to pick your fav color
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

;; Prevent Creation of Backup files
(setq make-backup-files nil)

;; Disable auto-save
(setq auto-save-default nil)

;; Prevent Lockfiles
(setq create-lockfiles nil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Disable all sounds
(setq visible-bell 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Disable Toolbar
;;(tool-bar-mode -1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Tab indentation
(setq tab-width 2 indent-tabs-mode nil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set column numbers
(setq column-number-mode t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set line numbers
(global-linum-mode 1)
(setq linum-format " %d ")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Easily move arround windows wiht shift  + arrow key
(windmove-default-keybindings)
(setq windmove-wrap-around t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Disable starup screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Enable auto-refreshing of all buffers
(global-auto-revert-mode t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Enable edo mode by default --> Disabling it, trying to use helm
;; (require 'ido)
;; (ido-mode t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Turn on highlighting matching brackets when cursor is on one of them
(show-paren-mode t)

;; Auto Close brackets
(electric-pair-mode t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Function and shortcut (C-d) to duplicate the current line
(defun duplicate-line (arg)
  "Duplicate current line, leaving point in lower line."
  (interactive "*p")

  ;; Save the point for undo
  (setq buffer-undo-list (cons (point) buffer-undo-list))

  ;; Local variables for start and end of line
  (let ((bol (save-excursion (beginning-of-line) (point)))
        eol)
    (save-excursion

      ;; Don't use forward-line for this, because you would have
      ;; to check whether you are at the end of the buffer
      (end-of-line)
      (setq eol (point))

      ;; Store the line and disable the recording of undo information
      (let ((line (buffer-substring bol eol))
            (buffer-undo-list t)
            (count arg))
        ;; Insert the line arg times
        (while (> count 0)
          (newline)         ;; because there is no newline in 'line'
          (insert line)
          (setq count (1- count)))
        )

      ;; Create the undo information
      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list)))
    ) ; End-of-let

  ;; Put the point in the lowest line and return
  (next-line arg))
(global-set-key (kbd "C-d") 'duplicate-line)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set Title bar to show the name of the full path of the file which is open
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
	    '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Start Elscreen by default(gives functionality similar to tabs)
(elscreen-start)

;; For moving with Ctrl + PgUp/PgDown through screens
(global-set-key [C-prior] 'elscreen-previous)
(global-set-key [C-next] 'elscreen-next)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Expand Regions -- Ctrl W feature of intelliJ
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)    ;; Expand   with ctrl =
(global-set-key (kbd "C-+") 'er/contract-region)  ;; Contract with ctrl shift =
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Remap C-w to cut whole line if no selection is made
(defun xah-cut-line-or-region ()
  "Cut current line, or text selection.
When `universal-argument' is called first, cut whole buffer (respects `narrow-to-region').
URL `http://ergoemacs.org/emacs/emacs_copy_cut_current_line.html'
Version 2015-06-10"
  (interactive)
  (if current-prefix-arg
      (progn ; not using kill-region because we don't want to include previous kill
        (kill-new (buffer-string))
        (delete-region (point-min) (point-max)))
    (progn (if (use-region-p)
               (kill-region (region-beginning) (region-end) t)
             (kill-region (line-beginning-position) (line-beginning-position 2))))))
(global-set-key (kbd "C-w") 'xah-cut-line-or-region) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Remap M-w to copy whole line if no selection is made
(defun xah-copy-line-or-region ()
  "Copy current line, or text selection.
When called repeatedly, append copy subsequent lines.
When `universal-argument' is called first, copy whole buffer (respects `narrow-to-region').
URL `http://ergoemacs.org/emacs/emacs_copy_cut_current_line.html'
Version 2015-09-18"
  (interactive)
  (let (ξp1 ξp2)
    (if current-prefix-arg
        (progn (setq ξp1 (point-min))
               (setq ξp2 (point-max)))
      (progn
        (if (use-region-p)
            (progn (setq ξp1 (region-beginning))
                   (setq ξp2 (region-end)))
          (progn (setq ξp1 (line-beginning-position))
                 (setq ξp2 (line-end-position))))))
    (if (eq last-command this-command)
        (progn
          (kill-append "\n" nil)
          (forward-line 1)
          (end-of-line)
          (kill-append (buffer-substring-no-properties (line-beginning-position) (line-end-position)) nil)
          (message "Line copy appended"))
      (progn
        (kill-ring-save ξp1 ξp2)
        (if current-prefix-arg
            (message "Buffer text copied")
          (message "Text copied"))))))
(global-set-key (kbd "M-w") 'xah-copy-line-or-region)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Enable Folding/Unfolding of code with mouse wherever possible
;; Customizing HideShowvis package : https://melpa.org/#/hideshowvis
(autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")
(autoload 'hideshowvis-minor-mode
  "hideshowvis"
  "Will indicate regions foldable with hideshow in the fringe."
  'interactive)

;; Enabling list of modes for which fold should be active
(dolist
    (hook
     (list
      ;; List of modes wher folding should be done
      'emacs-lisp-mode-hook
      'c++-mode-hook
      'java-mode-hook
      )
     )
  (add-hook hook 'hideshowvis-enable))
(hideshowvis-symbols)

;; Customizing the symbol
(define-fringe-bitmap 'hideshowvis-hideable-marker [255 255 255 255 255 255 255 255])
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Swap Two windows
(defun swap-windows ()
  "If you have 2 windows, it swaps them." 
  (interactive)
  (cond ((not (= (count-windows) 2)) (message "You need exactly 2 windows to do this."))
        (t
         (let* ((w1 (first (window-list)))
                (w2 (second (window-list)))
                (b1 (window-buffer w1))
                (b2 (window-buffer w2))
                (s1 (window-start w1))
                (s2 (window-start w2)))
           (set-window-buffer w1 b2)
           (set-window-buffer w2 b1)
           (set-window-start w1 s2)
           (set-window-start w2 s1)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Toggle Comment on Line/Selected Region
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
	(setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)
    (next-line)))
(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)
;; Overriding default behaviour to insert comment at end of line.
;; Rather toggle comment on whole line/ selected region
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Join Lines with M-j
(global-set-key (kbd "M-j")
		(lambda () (interactive) (join-line -1)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Markdown real time
(add-hook 'markdown-mode-hook 
          (lambda () 
	    (add-hook 'after-save-hook 'gh-md-render-buffer nil 'make-it-local)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Show git diff in side gutter of emacs
(global-diff-hl-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Magit alias to M-x g s
(global-set-key (kbd "M-g s") 'magit-status)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set smooth scrolling
;; Mouse
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)
;; Keyboard
(require 'smooth-scrolling)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Upon Paste, if something is selected, replace it rather than paste next to it
(delete-selection-mode t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Helm config
(require 'helm)
(require 'helm-config)

;; (global-set-key (kbd "C-c h") 'helm-command-prefix)
;; (global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
;; (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)
(helm-autoresize-mode t)

(global-set-key (kbd "C-S-s") 'helm-occur)

(helm-mode t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Flycheck enable -> Syntax checking on the fly
(add-hook 'after-init-hook #'global-flycheck-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Setup Projectile and make it play nicely with helm
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action 'helm-projectile)
(helm-projectile-on)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Dired show file name in human readable format
(setq dired-listing-switches "-alhk")

;; Setting up shortcut key for direx
(global-set-key (kbd "C-x C-d") 'direx-project:jump-to-project-root)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Customizing sr-speedbar
(global-set-key (kbd "<f8>") 'sr-speedbar-toggle)

(require 'speedbar)
(require 'advice)
(require 'cl-lib)
(eval-when-compile
  (require 'cl))

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; User Customization ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defgroup sr-speedbar nil
  "Same frame speedbar."
  :group 'speedbar)

(defcustom sr-speedbar-default-width 40
  "Initial width of `sr-speedbar-window' under window system."
  :type 'integer
  :group 'sr-speedbar)

(defcustom sr-speedbar-max-width 50
  "The max width limit that window allowed.
Default, if hide `sr-speedbar' window will remember
window width, except the window width larger than
this value."
  :type 'integer
  :group 'sr-speedbar)

(defcustom sr-speedbar-auto-refresh t
  "Automatically refresh speedbar content when changed directory.
Default is t."
  :type 'boolean
  :set (lambda (symbol value)
         (set symbol value))
  :group 'sr-speedbar)

(defcustom sr-speedbar-right-side nil
  "Show the speedbar to the right side of the current window.
If nil, the speedbar will appear on the left.
Default is t."
  :type 'boolean
  :set (lambda (symbol value)
         (set symbol value))
  :group 'sr-speedbar)

(defcustom sr-speedbar-delete-windows nil
  "Allow the speedbar to delete other windows before showing up.
If nil, speedbar will not touch your window configuration.
Otherwise `delete-other-windows' will be called before showing
the speedbar.

Default is nil."
  :type 'boolean
  :group 'sr-speedbar)

(if (not (fboundp 'ad-advised-definition-p))
    (defun ad-advised-definition-p (definition)
      "Return non-nil if DEFINITION was generated from advice information."
      (if (or (ad-lambda-p definition)
              (macrop definition)
              (ad-compiled-p definition))
          (let ((docstring (ad-docstring definition)))
            (and (stringp docstring)
                 (get-text-property 0 'dynamic-docstring-function docstring))))))

(defun sr-speedbar-handle-other-window-advice (activate)
  "Handle advice for function `other-window'.
If ACTIVATE is `non-nil' enable advice `sr-speedbar-other-window-advice'.
Otherwise disable it."
  (if activate
      (ad-enable-advice 'other-window 'after 'sr-speedbar-other-window-advice)
    (ad-disable-advice 'other-window 'after 'sr-speedbar-other-window-advice))
  (ad-activate 'other-window))

(defcustom sr-speedbar-skip-other-window-p nil
  "Whether skip `sr-speedbar' window with `other-window'.
Default, can use `other-window' select window in cyclic
ordering of windows.  But sometimes we don't want select
`sr-speedbar' window use `other-window'.
Just want make `sr-speedbar' window as a view sidebar.

So please turn on this option if you want skip
`sr-speedbar' window with `other-window'.

Default is nil."
  :type 'boolean
  :set (lambda (symbol value)
         (set symbol value)
         (if (fboundp 'ad-advised-definition-p)
             (when (ad-advised-definition-p 'other-window)
               (sr-speedbar-handle-other-window-advice value))
           (when (ad-is-advised 'other-window)
             (sr-speedbar-handle-other-window-advice value))))
  :group 'sr-speedbar)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Constant ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defconst sr-speedbar-buffer-name "*SPEEDBAR*"
  "The buffer name of sr-speedbar.")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Variables ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar sr-speedbar-width sr-speedbar-default-width
  "Initial width of speedbar-window.")

(defvar sr-speedbar-window nil
  "Speedbar window.")

(defvar sr-speedbar-last-refresh-dictionary nil
  "The last refresh dictionary record of 'sr-speedbar-refresh'.")

(eval-when-compile
  (defvar ecb-activated-window-configuration nil)
  (defun ecb-activate ())
  (defun ecb-deactivate ()))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Interactive functions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;###autoload
(defun sr-speedbar-toggle ()
  "Toggle sr-speedbar window.
Toggle visibility of sr-speedbar by resizing
the `sr-speedbar-window' to a minimal width
or the last width when visible.
Use this function to create or toggle visibility
of a speedbar-window.  It will be created if necessary."
  (interactive)
  (if (sr-speedbar-exist-p)
      (sr-speedbar-close)
    (sr-speedbar-open)))

;;;###autoload
(defun sr-speedbar-open ()
  "Create `sr-speedbar' window."
  (interactive)
  (if (not (sr-speedbar-exist-p))
      (let ((current-window (selected-window)))
        ;; Ensure only one window is there
        ;; when `sr-speedbar-delete-windows' is non-nil
        (if sr-speedbar-delete-windows
            (delete-other-windows))
        ;; Whether activate `other-window' advice
        ;; to skip `sr-speedbar' window when use `other-window'.
        (sr-speedbar-handle-other-window-advice sr-speedbar-skip-other-window-p)
        ;; Switch buffer
        (if (sr-speedbar-buffer-exist-p speedbar-buffer)
            (unless (sr-speedbar-window-exist-p sr-speedbar-window)
              (sr-speedbar-get-window))
          (if (<= (sr-speedbar-current-window-take-width) sr-speedbar-width)
              (setq sr-speedbar-width sr-speedbar-default-width))
          (sr-speedbar-get-window)             ;get `sr-speedbar' window that split current window
          (setq speedbar-buffer (get-buffer-create sr-speedbar-buffer-name)
                speedbar-frame (selected-frame)
                dframe-attached-frame (selected-frame)
                speedbar-select-frame-method 'attached
                speedbar-verbosity-level 0 ;don't say anything, i don't like ... :)
                speedbar-last-selected-file nil)
          (set-buffer speedbar-buffer)
          (buffer-disable-undo speedbar-buffer) ;make disable in speedbar buffer, otherwise will occur `undo-outer-limit' error
          (speedbar-mode)
          (speedbar-reconfigure-keymaps)
          (speedbar-update-contents)
          (speedbar-set-timer 1)
          ;; Add speedbar hook.
          (add-hook 'speedbar-before-visiting-file-hook 'sr-speedbar-before-visiting-file-hook t)
          (add-hook 'speedbar-before-visiting-tag-hook 'sr-speedbar-before-visiting-tag-hook t)
          (add-hook 'speedbar-visiting-file-hook 'sr-speedbar-visiting-file-hook t)
          (add-hook 'speedbar-visiting-tag-hook 'sr-speedbar-visiting-tag-hook t)
          ;; Add `kill-buffer-hook'.
          (add-hook 'kill-buffer-hook 'sr-speedbar-kill-buffer-hook) ;add `kill-buffer-hook'
          ;; Auto refresh speedbar content
          ;; if option `sr-speedbar-auto-refresh' is non-nil
          (sr-speedbar-handle-auto-refresh sr-speedbar-auto-refresh))
        (set-window-buffer sr-speedbar-window (get-buffer sr-speedbar-buffer-name))
        (set-window-dedicated-p sr-speedbar-window t) ;make `sr-speedbar-window' dedicated to speedbar-buffer.
        (select-window current-window))
    (message "`sr-speedbar' window has exist.")))

(defun sr-speedbar-close ()
  "Close `sr-speedbar' window and save window width."
  (interactive)
  (if (sr-speedbar-exist-p)
      (let ((current-window (selected-window)))
        ;; Remember window width.
        (sr-speedbar-select-window)
        (sr-speedbar-remember-window-width)
        ;; Close window.
        (if (and (require 'ecb nil t)
                 ecb-activated-window-configuration)
            ;; Toggle ECB window when ECB window activated.
            (progn
              (ecb-deactivate)
              (ecb-activate))
          ;; Otherwise delete dedicated window.
          (delete-window sr-speedbar-window)
          (if (sr-speedbar-window-exist-p current-window)
              (select-window current-window))))
    (message "`sr-speedbar' window is not exist.")))

(defun sr-speedbar-select-window ()
  "Force the windows that contain `sr-speedbar'."
  (interactive)
  (if (sr-speedbar-exist-p)
      (select-window sr-speedbar-window)
    (message "`sr-speedbar' window is not exist.")))

(defun sr-speedbar-refresh-turn-on ()
  "Turn on refresh content automatically."
  (interactive)
  (setq sr-speedbar-auto-refresh t)
  (sr-speedbar-handle-auto-refresh sr-speedbar-auto-refresh t))

(defun sr-speedbar-refresh-turn-off ()
  "Turn off refresh content automatically."
  (interactive)
  (setq sr-speedbar-auto-refresh nil)
  (sr-speedbar-handle-auto-refresh sr-speedbar-auto-refresh t))

(defun sr-speedbar-refresh-toggle ()
  "Toggle refresh content status."
  (interactive)
  (setq sr-speedbar-auto-refresh (not sr-speedbar-auto-refresh))
  (sr-speedbar-handle-auto-refresh sr-speedbar-auto-refresh t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; utilise functions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun sr-speedbar-exist-p ()
  "Return `non-nil' if `sr-speedbar' is exist.
Otherwise return nil."
  (and (sr-speedbar-buffer-exist-p speedbar-buffer)
       (sr-speedbar-window-exist-p sr-speedbar-window)))

(defun sr-speedbar-window-p ()
  "Return `non-nil' if current window is `sr-speedbar' window.
Otherwise return nil."
  (equal sr-speedbar-buffer-name (buffer-name (window-buffer))))

(defun sr-speedbar-remember-window-width ()
  "Remember window width."
  (let ((win-width (sr-speedbar-current-window-take-width)))
    (if (and (sr-speedbar-window-p)
             (> win-width 1)
             (<= win-width sr-speedbar-max-width))
        (setq sr-speedbar-width win-width))))

(defun sr-speedbar-get-window ()
  "Get `sr-speedbar' window."
  (let ((current-window (selected-window))
        ;; Get split new window.
        (new-window (split-window
                     (selected-window)
                     (if sr-speedbar-right-side
                         (- (sr-speedbar-current-window-take-width) sr-speedbar-width)
                       sr-speedbar-width)
                     t)))
    ;; Select split window.
    (setq sr-speedbar-window
          (if sr-speedbar-right-side
              ;; Select right window when `sr-speedbar-right-side' is enable.
              new-window
            ;; Otherwise select left widnow.
            current-window))))

(defun sr-speedbar-before-visiting-file-hook ()
  "Function that hook `speedbar-before-visiting-file-hook'."
  (select-window (previous-window)))

(defun sr-speedbar-before-visiting-tag-hook ()
  "Function that hook `speedbar-before-visiting-tag-hook'."
  (select-window (previous-window)))

(defun sr-speedbar-visiting-file-hook ()
  "Function that hook `speedbar-visiting-file-hook'."
  (select-window (previous-window)))

(defun sr-speedbar-visiting-tag-hook ()
  "Function that hook `speedbar-visiting-tag-hook'."
  (select-window (previous-window)))

(defun sr-speedbar-kill-buffer-hook ()
  "Function that hook `kill-buffer-hook'."
  (when (eq (current-buffer) speedbar-buffer)
    (setq speedbar-frame nil
          dframe-attached-frame nil
          speedbar-buffer nil)
    (speedbar-set-timer nil)
    (remove-hook 'speedbar-before-visiting-file-hook 'sr-speedbar-before-visiting-file-hook)
    (remove-hook 'speedbar-before-visiting-tag-hook 'sr-speedbar-before-visiting-tag-hook)
    (remove-hook 'speedbar-visiting-file-hook 'sr-speedbar-visiting-file-hook)
    (remove-hook 'speedbar-visiting-tag-hook 'sr-speedbar-visiting-tag-hook)))

(defun sr-speedbar-refresh ()
  "Refresh the context of speedbar."
  (when (and (not (equal default-directory sr-speedbar-last-refresh-dictionary)) ;if directory is change
             (not (sr-speedbar-window-p))) ;and is not in speedbar buffer
    (setq sr-speedbar-last-refresh-dictionary default-directory)
    (speedbar-refresh)))

(defun sr-speedbar-handle-auto-refresh (activate &optional echo-show)
  "Automatically refresh speedbar content when changed directory.
Do nothing if option ACTIVATE is nil.
Will display message if ECHO-SHOW is non-nil."
  (if activate
      (progn
        (add-hook 'speedbar-timer-hook 'sr-speedbar-refresh)
        (if echo-show (message "Turn on speedbar content refresh automatically.")))
    (remove-hook 'speedbar-timer-hook 'sr-speedbar-refresh)
    (if echo-show (message "Turn off speedbar content refresh automatically."))))

(defun sr-speedbar-current-window-take-width (&optional window)
  "Return the width that WINDOW take up.
If WINDOW is nil, get current window."
  (let ((edges (window-edges window)))
    (- (nth 2 edges) (nth 0 edges))))

(defun sr-speedbar-window-dedicated-only-one-p ()
  "Only have one non-dedicated window."
  (interactive)
  (let ((window-number 0)
        (dedicated-window-number 0))
    (walk-windows
     (lambda (w)
       (with-selected-window w
         (incf window-number)
         (if (window-dedicated-p w)
             (incf dedicated-window-number)))))
    (if (and (> dedicated-window-number 0)
             (= (- window-number dedicated-window-number) 1))
        t nil)))

(defun sr-speedbar-window-exist-p (window)
  "Return `non-nil' if WINDOW is exist.
Otherwise return nil."
  (and window (window-live-p window)))

(defun sr-speedbar-buffer-exist-p (buffer)
  "Return `non-nil' if BUFFER is exist.
Otherwise return nil."
  (and buffer (buffer-live-p buffer)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Advices ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defadvice delete-other-windows (around sr-speedbar-delete-other-window-advice activate)
  "This advice to make `sr-speedbar' window can't deleted by command `delete-other-windows'."
  (let ((sr-speedbar-active-p (sr-speedbar-window-exist-p sr-speedbar-window)))
    (if sr-speedbar-active-p
        (let ((current-window (selected-window)))
          (dolist (win (window-list))
            (when (and (window-live-p win)
                       (not (eq current-window win))
                       (not (window-dedicated-p win)))
              (delete-window win))))
      ad-do-it)))

(defadvice delete-window (before sr-speedbar-delete-window-advice activate)
  "This advice to remember `sr-speedbar' window width before deleted.
Use `delete-window' delete `sr-speedbar' window have same effect as `sr-speedbar-close'."
  ;; Remember window width before deleted.
  (sr-speedbar-remember-window-width))

(defadvice pop-to-buffer (before sr-speedbar-pop-to-buffer-advice activate)
  "This advice is to fix `pop-to-buffer' problem with dedicated window.
Default, function `display-buffer' can't display buffer in select window
if current window is `dedicated'.

So function `display-buffer' conflict with `sr-speedbar' window, because
`sr-speedbar' window is `dedicated' window.

That is to say, when current frame just have one `non-dedicated' window,
any functions that use `display-buffer' can't split windows
to display buffer, even option `pop-up-windows' is enable.

And the example function that can occur above problem is `pop-to-buffer'."
  (when (and pop-up-windows                            ;`pop-up-windows' is enable
             (sr-speedbar-window-dedicated-only-one-p) ;just have one `non-dedicated' window
             (sr-speedbar-window-exist-p sr-speedbar-window)
             (not (sr-speedbar-window-p)) ;not in `sr-speedbar' window
             (if (featurep 'helm)
		 (not helm-alive-p)
	       t))
    (split-window-vertically)
    (windmove-down)))

(defadvice other-window (after sr-speedbar-other-window-advice)
  "Default, can use `other-window' select window in cyclic ordering of windows.
But sometimes we don't want select `sr-speedbar' window use `other-window'.
Just want make `sr-speedbar' window as a view sidebar.

This advice can make `other-window' skip `sr-speedbar' window."
  (let ((count (or (ad-get-arg 0) 1)))
    (when (and (sr-speedbar-window-exist-p sr-speedbar-window)
               (eq sr-speedbar-window (selected-window)))
      (other-window count))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Enable ggtags mode by default in C,C++ and Java
(add-hook 'c-mode-common-hook
  (lambda ()
    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
      (ggtags-mode 1)
      )
    )
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
