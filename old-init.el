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



(provide 'init)


