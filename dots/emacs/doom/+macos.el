;;; ~/dotfiles/dots/emacs/doom/+macos.el -*- lexical-binding: t; -*-

;;;;
;;;; macOS specific settings
;;;;

(when (eq system-type 'darwin)       ; should be the same as (when IS-MAC...)
  (setq exec-path (append exec-path '("/Users/jchang/.nvm/versions/node/v8.11.4/bin")))

  (setq ns-use-thin-smoothing t)    ; thinner strokes for font-smoothing
  (setq dired-use-ls-dired nil)

  ;; macOS natural title bars
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark)))

