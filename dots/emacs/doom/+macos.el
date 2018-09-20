;;; ~/dotfiles/dots/emacs/doom/+macos.el -*- lexical-binding: t; -*-

;;;;
;;;; macOS specific settings
;;;;

(when (eq system-type 'darwin)       ; should be the same as (when IS-MAC...)
  (setq ns-use-thin-smoothing t)    ; thinner strokes for font-smoothing
  ;; macOS natural title bars
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
  (setq doom-theme 'doom-nord))

