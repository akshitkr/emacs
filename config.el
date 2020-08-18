(setq delete-old-versions -1 ) ; delete excess backups silently
(setq version-control t )
(setq vc-make-backup-files t )
(setq vc-follow-symlinks t )
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")) )
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)) )
(setq inhibit-startup-screen t )
(setq ring-bell-function 'ignore ) ; silent bell on mistakes
(setq coding-system-for-read 'utf-8 )
(setq coding-system-for-write 'utf-8)
(setq sentence-end-double-space nil)
(setq-default fill-column 80) ; toggle wrapping text at this column
(setq initial-scratch-message "Hi Akshit. C-x C-f eh" ) ; You should probably change this
(menu-bar-mode -1) ; no need for the menu bars - we've got key combos for that!
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(transient-mark-mode t)
;; Use font lock mode
(global-font-lock-mode t)
(show-paren-mode 1)
(electric-pair-mode 1)
(setq sroll-conservatively 100)
(package-initialize)
(setq use-package-always-ensure t)
(windmove-default-keybindings)
(use-package find-file-in-project)

(add-hook 'window-setup-hook (lambda()
		       (setq ns-auto-hide-menu-bar t)
		       (set-frame-position nil 0 -24)
		       (set-frame-size nil (display-pixel-width) (display-pixel-height) t)))
(add-hook 'after-init-hook 'global-hl-line-mode)
(setq show-paren-delay 0)
(global-visual-line-mode t)
(setq-default show-trailing-whitespace t)
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook (lambda() (delete-trailing-whitespace)))

(require 'all-the-icons)
(setq sml/no-confirm-load-theme t)
 (setq sml/theme 'dark) ;; changes the theme to dark
(sml/setup) ;; automati

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents) ; update archives
  (package-install 'use-package)) ; grab the newest use-package

;; Define packages
(require 'use-package)

(add-hook 'after-init-hook 'global-company-mode)

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(unless (package-installed-p 'evil)
  (package-install 'evil))
(require 'evil)
(evil-mode 1)

;;font
 (set-face-attribute 'default nil
		     :family "Fira Code Light"
)

(add-hook 'after-init-hook 'global-company-mode)
(setq company-dabbrev-downcase 0)
(setq company-idle-delay 0)
  (require 'color)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(use-package flycheck
  :init (global-flycheck-mode))

(use-package dired-sidebar
  :ensure t
  :commands (dired-sidebar-toggle-sidebar))

(use-package rjsx-mode
  :ensure t
  :mode "\\.js\\'")

(add-hook 'rjsx-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil) ;;Use space instead of tab
	    (setq js-indent-level 2) ;;space width is 2 (default is 4)
	    (setq js2-strict-missing-semi-warning nil))) ;;disable the semicolon warning

(add-to-list 'auto-mode-alist '("\\.js\\'"    . rjsx-mode))

(use-package prettier-js)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
;;  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))
;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)
(setq tide-completion-ignore-case t)
;; formats the buffer before saving
;;(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'js2-mode-hook #'setup-tide-mode)
(add-hook 'rjsx-mode-hook #'setup-tide-mode)
(setq tide-format-options
      '(:indentSize 2 :tabSize 2))

(require 'rust-mode)

(use-package ample-theme
  :init (progn (load-theme 'ample t t)
	       (load-theme 'ample-flat t t)
	       (load-theme 'ample-light t t)
	       (enable-theme 'ample-flat))
  :defer t
  :ensure t)

(yas-global-mode  t)
(require 'react-snippets) ;;react snippets

(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")

(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
	    '(:with company-yasnippet))))

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(use-package page-break-lines
      :ensure t
)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(setq dashboard-items '((recents  . 5)
			(bookmarks . 5)
			(projects . 5)
			(agenda . 5)
			(registers . 5)))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/spotify.el-master"))
(require 'spotify)

(setq spotify-oauth2-client-secret "974b03419fde42d98cf6eb904691e2ed")
(setq spotify-oauth2-client-id "6d1b54344e304c99bcdef61070f0ce26")
(define-key spotify-mode-map (kbd "C-w .") 'spotify-command-map)
