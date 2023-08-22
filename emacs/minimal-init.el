;; -
;; minimal emacs configuration for fastest possible start up time (no plugins)
;; -

(menu-bar-mode 0)

(add-hook
 'text-mode-hook
 (lambda ()
   (visual-line-mode 1)))

(dolist
    (mode-hook
     '(Info-mode-hook
       conf-mode-hook
       org-mode-hook
       org-agenda-mode-hook
       package-menu-mode-hook
       prog-mode-hook
       text-mode-hook))
  (add-hook mode-hook #'hl-line-mode))

(setq-default show-trailing-whitespace t)
(setq-default indent-tabs-mode nil)
(setq sentence-end-double-space nil)

(dolist
    (mode-hook
     '(help-mode-hook
       Info-mode-hook))
  (add-hook
   mode-hook
   (lambda ()
     (setq show-trailing-whitespace nil))))
(setq create-lockfiles nil)

(setq make-backup-files nil)
(global-auto-revert-mode 1)

(setq use-short-answers t)

;; force go mod files to use fundamental-mode instead of modula-2-mode
(add-to-list 'auto-mode-alist '("\\.mod\\'" . fundamental-mode))

(define-key global-map (kbd "C-c l") 'display-line-numbers-mode)
(define-key global-map (kbd "C-c e g") 'r/git)
(define-key global-map (kbd "C-c e G") 'r/go-programming)
(define-key global-map (kbd "C-c e l") 'r/lisp-programming)
(define-key global-map (kbd "C-c e m") 'r/markdown-writing)
(define-key global-map (kbd "C-c e p") 'r/programming)
(define-key global-map (kbd "C-c e s") 'r/shell-programming)
(define-key global-map (kbd "C-c e y") 'r/yaml-programming)

;; -
;; progressive enhacements (to be manually invoked with M-x or keybindings)
;; -

(defun r/markdown-writing ()
  (interactive)
  (package-initialize t)
  (package-activate 'markdown-mode)
  (markdown-mode)
  (display-line-numbers-mode)
  (hl-line-mode))

(defun r/git ()
  (interactive)
  (package-initialize t)
  (package-activate 'magit))

(defun r/programming ()
  (interactive)
  (column-number-mode)
  (display-line-numbers-mode))

(defun r/lisp-programming ()
  (interactive)
  (package-initialize t)
  (package-activate 'lispy)
  (checkdoc-minor-mode)
  (display-line-numbers-mode)
  (electric-pair-local-mode)
  (lispy-mode))

(defun r/go-programming ()
  (interactive)
  (package-initialize t)
  (package-activate 'go-mode)
  (go-mode)
  (r/programming)
  (add-hook 'before-save-hook 'gofmt-before-save))

(defun r/shell-programming ()
  (interactive)
  (r/programming)
  (setq tab-width 2)
  (setq indent-line-function 'insert-tab))

(defun r/yaml-programming ()
  (interactive)
  (package-initialize t)
  (package-activate 'yaml-mode)
  (yaml-mode)
  (display-line-numbers-mode))

(defun r/writing ()
  (interactive)
  (hl-line-mode)
  (add-to-list 'load-path (concat user-emacs-directory "ronchi"))
  (require 'ronchi-utils)
  (define-key global-map (kbd "C-c i d") 'ronchi/insert-curr-date)
  (define-key global-map (kbd "C-c i u") 'ronchi/org-insert-status-update))

(defun r/copy-buffer-file-name-to-tmux-buffer ()
  (interactive)
  (shell-command (message "tmux set-buffer %s" (buffer-file-name))))

;; -
;; load my basic writing bindings
;; -
(r/writing)
