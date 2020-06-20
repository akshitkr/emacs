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

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents) ; update archives
  (package-install 'use-package)) ; grab the newest use-package

;; Define packages
(require 'use-package)

(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

(defalias 'yes-or-no-p 'y-or-n-p)

(add-hook 'after-init-hook 'global-company-mode)

(setq ido-enable-flex-matching nil)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere t)
(ido-mode 1)

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
		    :family "Roboto mono"
		    :height 130
		    :weight 'normal
		    :width 'normal)

(add-hook 'after-init-hook 'global-company-mode)
   (setq company-dabbrev-downcase 0)
   (setq company-idle-delay 0)
     (require 'color)
  
(setq company-tooltip-align-annotations t)
  (let ((bg (face-attribute 'default :background)))
    (custom-set-faces
     `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
     `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
     `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
     `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
     `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))

(require 'elcord)
(elcord-mode)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

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
