;;; #init-ivy.el
;;; Commentary:
;;; http://oremacs.com/swiper/#installation
;;; https://sam217pa.github.io/2016/08/30/how-to-make-your-own-spacemacs/#fnref:3
;;; https://writequit.org/denver-emacs/presentations/2017-04-11-ivy.html#fnr.2
;;; Code:
(use-package ivy
  :diminish (ivy-mode . "")
  :init (ivy-mode 1) ; globally at startup
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-height 20)
  (setq ivy-count-format "%d/%d "))
(provide 'init-ivy)
;;; init-ivy.el ends here.
