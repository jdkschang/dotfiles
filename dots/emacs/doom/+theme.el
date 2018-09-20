;;; ~/dotfiles/dots/emacs/doom/+theme.el -*- lexical-binding: t; -*-

;;;;;
;;;;; Themes
;;;;;

;; Setting light & dark themes
(defvar light-theme 'doom-nord-light) ; doom-nord-light doom-one-light doom-solarized-light
(defvar dark-theme 'doom-nord) ; doom-one doom-molokai doom-opera doom-city-lights

;; System agnostic default theme choice goes here:
(setq doom-theme dark-theme)

;; hotswap between themes
(defun +jdkschang/toggle-theme ()
  "Toggle between light and dark themes."
  (interactive)
  (cond ((eq doom-theme dark-theme)
		 (message "Toggling to light-theme: %s" light-theme)
		 (setq doom-theme light-theme)
		 (doom/reload-theme))
		((eq doom-theme light-theme)
		 (message "Toggling to dark-theme: %s" dark-theme)
		 (setq doom-theme dark-theme)
		 (doom/reload-theme))
		(t (message "Can't toggle theme: not using light-theme (%s) or dark-theme (%s)." light-theme dark-theme))))
