;;; ~/dotfiles/dots/emacs/doom/+bindings.el -*- lexical-binding: t; -*-
(map! :m "M-j" #'multi-next-line
      :m "M-k" #'multi-previous-line

      ;; Easier window movement
      :n "C-h" #'evil-window-left
      :n "C-j" #'evil-window-down
      :n "C-k" #'evil-window-up
      :n "C-l" #'evil-window-right

      (:map vterm-mode-map
        ;; Easier window movement
        :i "C-h" #'evil-window-left
        :i "C-j" #'evil-window-down
        :i "C-k" #'evil-window-up
        :i "C-l" #'evil-window-right)

      (:map evil-treemacs-state-map
        "C-h" #'evil-window-left
        "C-l" #'evil-window-right
        "M-j" #'multi-next-line
        "M-k" #'multi-previous-line)

      (:when (featurep! :ui workspaces)
        :nmvi "s-`" #'+workspace/cycle
        :nmvi "s-t" #'+workspace/new
        :nmvi "s-1" (λ! (+workspace/switch-to 0))
        :nmvi "s-2" (λ! (+workspace/switch-to 1))
        :nmvi "s-3" (λ! (+workspace/switch-to 2))
        :nmvi "s-4" (λ! (+workspace/switch-to 3))
        :nmvi "s-5" (λ! (+workspace/switch-to 4))
        :nmvi "s-6" (λ! (+workspace/switch-to 5))
        :nmvi "s-7" (λ! (+workspace/switch-to 6))
        :nmvi "s-8" (λ! (+workspace/switch-to 7))
        :nmvi "s-9" (λ! (+workspace/switch-to 8)))

      :nmvi "s-d" #'evil-multiedit-match-symbol-and-next

      ;; toggle transparency
      :gnvime "s-u" #'+jdkschang/toggle-transparency
      :n "J" 'evil-join


      :leader
      "`" #'evil-switch-to-windows-last-buffer
      (:prefix "f"
        "t" #'find-in-dotfiles
        "T" #'browse-dotfiles)
      ;;
      ;; toggle theme
      (:prefix "t"
        :desc "toggle-theme" :n "t" #'+jdkschang/toggle-theme)
      ;;
      ;; origami folds
      (:prefix "z"
        ;; :map origami-mode-map
        :desc "origami-recursively-toggle-node" :nv "z" #'origami-recursively-toggle-node
        :desc "origami-recursively-toggle-node" :i "C-z" #'origami-recursively-toggle-node
        :desc "origami-toggle-node" :nv "z" #'origami-toggle-node
        :desc "origami-toggle-node" :i "C-Z" #'origami-toggle-node
        :desc "origami-show-only-node" :nv "s-z" #'origami-show-only-node)
      (:prefix "n"
        :desc "Browse project notes" :n "p" #'+jdkschang/find-notes-for-project)
      (:prefix "o"
        :desc "eshell in popup" :n "e" #'+eshell/open-popup
        :desc "eshell" :n "E" #'+eshell/open))
