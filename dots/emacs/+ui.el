;;; ~/.doom.d/+ui.el -*- lexical-binding: t; -*-

;; Theme
(setq doom-theme 'doom-nord)

;; Fonts
(setq doom-font (font-spec :family "Operator Mono SSm" :size 16))
(setq doom-big-font (font-spec :family "Operator Mono SSm" :size 28))

;; Dash highlighting
(after! dash (dash-enable-font-lock))

(load! "+magit")
