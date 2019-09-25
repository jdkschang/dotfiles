;;; ~/dotfiles/dots/emacs/doom/+ui.el -*- lexical-binding: t; -*-

;; Setting transparency values
(defvar solid 100)
(defvar transparent 88)

;; hotswap between transparencies
(defun +jdkschang/toggle-transparency ()
  (interactive)
  (cond
   ((eq (frame-parameter nil 'alpha) solid)
    (message "Toggling to transparent: %s" transparent)
    (set-frame-parameter nil 'alpha transparent))

   ((eq (frame-parameter nil 'alpha) transparent)
    (message "Toggling to solid: %s" solid)
    (set-frame-parameter nil 'alpha solid))

   (t (message "Can't toggle transparency."))))

(set-frame-parameter nil 'alpha solid)

;; Font
(setq doom-font (font-spec :family "IBM Plex Mono" :size 15)
      doom-big-font (font-spec :family "IBM Plex Mono" :size 20)
      doom-variable-pitch-font (font-spec :family "IBM Plex Mono" :slant 'italic :size 17))

(defun +jdkschang/italicize-comments ()
  (set-face-italic 'font-lock-comment-face t))
(add-hook 'doom-load-theme-hook #'+jdkschang/italicize-comments)

;; Dash highlighting
(after! dash (dash-enable-font-lock))
