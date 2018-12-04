;;; ~/dotfiles/dots/emacs/doom/+bindings.el -*- lexical-binding: t; -*-

(map!
 (:leader
   ;; toggle theme
   (:prefix "t"
     :desc "toggle-theme" :n "t" #'+jdkschang/toggle-theme)
   ;; ranger
   (:prefix "a"
		 :desc "Ranger" :n "r" #'ranger
		 :desc "Deer" :n "d" #'deer))
 ;; toggle transparency
 (:gnvime "M-u" #'+jdkschang/toggle-transparency)

 (:n "C-h" #'evil-window-left)
 (:n "C-j" #'evil-window-down)
 (:n "C-k" #'evil-window-up)
 (:n "C-l" #'evil-window-right))
