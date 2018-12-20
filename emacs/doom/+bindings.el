;;; ~/dotfiles/dots/emacs/doom/+bindings.el -*- lexical-binding: t; -*-

(map!
 (:leader
   ;; toggle theme
   (:prefix "t"
     :desc "toggle-theme" :n "t" #'+jdkschang/toggle-theme)
   ;; ranger
   (:prefix "a"
     :desc "Ranger" :n "r" #'ranger
     :desc "Deer" :n "d" #'deer)
   ;; origami folds
   (:prefix "z"
     :desc "origami-recursively-toggle-node" :nv "z" #'origami-recursively-toggle-node
     :desc "origami-recursively-toggle-node" :i "C-z" #'origami-recursively-toggle-node
     :desc "origami-toggle-node" :nv "z" #'origami-toggle-node
     :desc "origami-toggle-node" :i "C-Z" #'origami-toggle-node
     :desc "origami-show-only-node" :nv "A-z" #'origami-show-only-node))

 ;; toggle transparency
 (:gnvime "M-u" #'+jdkschang/toggle-transparency)

 (:n "C-h" #'evil-window-left)
 (:n "C-j" #'evil-window-down)
 (:n "C-k" #'evil-window-up)
 (:n "C-l" #'evil-window-right))
