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

(set-frame-parameter nil 'alpha transparent)

;; Font
(setq doom-font (font-spec :family "Operator Mono SSm Lig" :size 16)
      doom-big-font (font-spec :family "Operator Mono SSm Lig" :size 28)
      doom-variable-pitch-font (font-spec :family "Operator Mono SSm Lig" :slant 'italic)
      doom-unicode-font (font-spec :family "Operator Mono SSm Lig")
			;; Line Numbers
			display-line-numbers-type 'relative)

(defun +jdkschang/italicize-comments ()
  (set-face-italic 'font-lock-comment-face t))

(add-hook 'doom-load-theme-hook #'+jdkschang/italicize-comments)

;; Dash highlighting
(after! dash (dash-enable-font-lock))

(load! "+magit")
