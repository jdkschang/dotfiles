;;; ~/dotfiles/dots/emacs/doom/+bindings.el -*- lexical-binding: t; -*-

(map!
 ;; toggle theme
 (:leader
   (:prefix "t"
	 :desc "toggle-theme" :n "t" #'+jdkschang/toggle-theme))
 ;; toggle transparency
 (:gnvime "M-u" #'+jdkschang/toggle-transparency))

(map! :n "C-h" #'evil-window-left
	  :n "C-j" #'evil-window-down
	  :n "C-k" #'evil-window-up
	  :n "C-l" #'evil-window-right)
