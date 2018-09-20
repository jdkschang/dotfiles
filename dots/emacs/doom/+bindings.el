;;; ~/dotfiles/dots/emacs/doom/+bindings.el -*- lexical-binding: t; -*-

;;;;;
;;;;; Bindings
;;;;;

(map!
 (:leader
   (:prefix "t"
	 :desc "toggle-theme" :n "t" #'+jdkschang/toggle-theme))
 (:gnvime "M-u" #'+jdkschang/toggle-transparency))
