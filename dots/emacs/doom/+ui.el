;;; ~/dotfiles/dots/emacs/doom/+ui.el -*- lexical-binding: t; -*-

;; natural title bar
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

;; Line Numbers
(setq display-line-numbers 'relative)
;; terminal mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] (lambda ()
							  (interactive)
							  (scroll-down 1)))
  (global-set-key [mouse-5] (lambda ()
							  (interactive)
							  (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t))

;; Theme
;; (setq doom-theme 'doom-nord)
;; (setq doom-theme 'doom-city-lights)
;; (setq doom-theme 'doom-opera)
;; (setq doom-theme 'doom-dracula)

(setq doom-font (font-spec :family "Operator Mono SSm" :size 16)
      doom-big-font (font-spec :family "Operator Mono SSm" :size 28)
      doom-variable-pitch-font (font-spec :family "Operator Mono SSm" :slant 'italic)
      doom-unicode-font (font-spec :family "Iosevka"))

(defun my-theme-customizations ()
  (set-face-italic 'font-lock-comment-face t))

(add-hook 'doom-load-theme-hook #'my-theme-customizations)

;; emoji
(add-hook 'after-init-hook #'global-emojify-mode)

;; Dash highlighting
(after! dash (dash-enable-font-lock))

(load! "+magit")
