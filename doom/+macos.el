;;; ~/dotfiles/dots/emacs/doom/+macos.el -*- lexical-binding: t; -*-

;;;;
;;;; macOS specific settings
;;;;

(when IS-MAC
  (setq ns-use-thin-smoothing t) ; thinner strokes for font-smoothing
  (setq dired-use-ls-dired nil)
  (add-hook 'window-setup-hook #'toggle-frame-maximized)
  ;; macOS natural title bars
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark)))
