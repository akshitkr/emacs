(defun setup-tide-mode()
  "Setup tide"
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save-mode-enabled))
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(use-package tide
  :ensure t
  :after(rjsx-mode company flycheck)
  :hook(rjsx-mode. setup-tide-mode))

(provide 'init-tide)
