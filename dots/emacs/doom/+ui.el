;;; ~/dotfiles/dots/emacs/doom/+ui.el -*- lexical-binding: t; -*-

;; Themes
(setq doom-themes-enable-bold t
	  doom-themes-enable-italic t)

;; (load-theme 'doom-nord t)
;; (load-theme 'doom-opera t)
(load-theme 'doom-city-lights t)

;; Fonts
(setq doom-font (font-spec :family "Operator Mono SSm" :size 16))
;; On my (almost) 1440p monitor, 28pt Hack gives me about 30 lines and maybe
;; 100-120 columns, which seems like a good zoomed in size for eye
;; strain/showing other people stuff
(setq doom-big-font (font-spec :family "Operator Mono SSm" :size 28))

;; Dash highlighting
(after! dash (dash-enable-font-lock))

(load! "+magit")
