;;; ~/dotfiles/dots/emacs/doom/+ranger.el -*- lexical-binding: t; -*-

(def-package! ranger
  :commands (ranger deer ranger-override-dired-fn)
  :config
  (set-popup-rule! "^\\*ranger" :ignore t))

(add-hook! dired-mode #'ranger-override-dired-fn) ;; Override dired-mode so it uses deer
