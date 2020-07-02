;;; ~/dotfiles/dots/emacs/doom/+theme.el -*- lexical-binding: t; -*-

(require 'doom-themes)
;;;;;
;;;;; Themes
;;;;;

;; (load-theme 'doom-ayu-light)
(doom-themes-visual-bell-config)

(setq doom-themes-treemacs-theme "doom-colors")
(doom-themes-treemacs-config)
(doom-themes-org-config)

;; Setting light & dark themes
(defvar light-theme 'doom-solarized-light) ; doom-nord-light doom-one-light doom-solarized-light
(defvar dark-theme 'doom-vibrant) ; doom-one doom-molokai doom-opera doom-Iosvkem doom-gruvbox
                                        ; doom-city-lights doom-peacock doom-fairy-floss doom-vibrant

;; System agnostic default theme choice goes here:
(setq doom-theme light-theme)

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
