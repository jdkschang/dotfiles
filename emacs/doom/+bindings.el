;;; ~/dotfiles/dots/emacs/doom/+bindings.el -*- lexical-binding: t; -*-

(map!
 (:leader
   ;; toggle theme
   (:prefix "t"
     :desc "toggle-theme" :n "t" #'+jdkschang/toggle-theme)
   ;; ranger
   ;; (:prefix "a"
   ;;   :desc "Ranger" :n "r" #'ranger
   ;;   :desc "Deer" :n "d" #'deer)
   ;; origami folds
   (:prefix "z"
                                        ; :map origami-mode-map
     :desc "origami-recursively-toggle-node" :nv "z" #'origami-recursively-toggle-node
     :desc "origami-recursively-toggle-node" :i "C-z" #'origami-recursively-toggle-node
     :desc "origami-toggle-node" :nv "z" #'origami-toggle-node
     :desc "origami-toggle-node" :i "C-Z" #'origami-toggle-node
     :desc "origami-show-only-node" :nv "A-z" #'origami-show-only-node))

 ;; toggle transparency
 (:gnvime "M-u" #'+jdkschang/toggle-transparency)
 ;; comments
 (:ne "M-/" #'comment-or-uncomment-region)

 (:when (featurep! :feature workspaces)
   :nmvi "s-t" #'+workspace/new
   :nmvi "s-1" (λ! (+workspace/switch-to 0))
   :nmvi "s-2" (λ! (+workspace/switch-to 1))
   :nmvi "s-3" (λ! (+workspace/switch-to 2))
   :nmvi "s-4" (λ! (+workspace/switch-to 3))
   :nmvi "s-5" (λ! (+workspace/switch-to 4))
   :nmvi "s-6" (λ! (+workspace/switch-to 5))
   :nmvi "s-7" (λ! (+workspace/switch-to 6))
   :nmvi "s-8" (λ! (+workspace/switch-to 7))
   :nmvi "s-9" (λ! (+workspace/switch-to 8))))


 ;; (:n "C-h" #'evil-window-left)
 ;; (:n "C-j" #'evil-window-down)
 ;; (:n "C-k" #'evil-window-up)
 ;; (:n "C-l" #'evil-window-right))
