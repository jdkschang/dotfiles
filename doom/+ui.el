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
    (doom/set-frame-opacity transparent))

   ((eq (frame-parameter nil 'alpha) transparent)
    (message "Toggling to solid: %s" solid)
    (doom/set-frame-opacity solid))

   (t (message "Can't toggle transparency."))))

(doom/set-frame-opacity transparent)

;; Font
(setq doom-font (font-spec :family "IBM Plex Mono" :size 15)
      doom-big-font (font-spec :family "IBM Plex Mono" :size 20)
      doom-variable-pitch-font (font-spec :family "IBM Plex Mono" :slant 'italic :size 17))

(defun +jdkschang/italicize-comments ()
  (set-face-italic 'font-lock-comment-face t))

(add-hook 'doom-load-theme-hook #'+jdkschang/italicize-comments)

