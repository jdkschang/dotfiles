;;; ~/dotfiles/dots/emacs/doom/+bindings.el -*- lexical-binding: t; -*-

;;;;;
;;;;; Bindings
;;;;;

(map!
 (:leader
   (:prefix "t"
	 :desc "toggle-theme" :n "t" #'+jdkschang/toggle-theme))
 (:gnvime "M-u" #'+jdkschang/toggle-transparency))

(map! :n "C-h" #'evil-window-left
	  :n "C-j" #'evil-window-down
	  :n "C-k" #'evil-window-up
	  :n "C-l" #'evil-window-right)
