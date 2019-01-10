;;; ~/dotfiles/dots/emacs/doom/+macos.el -*- lexical-binding: t; -*-

;;;;
;;;; macOS specific settings
;;;;

(defmacro help/on-mac-os (statement &rest statements)
  "Evaluate the enclosed body only when run on macOS."
  `(when (eq system-type 'darwin)
     ,statement
     ,@statements))

;; (when (eq system-type 'darwin)       ; should be the same as (when IS-MAC...)
;;   (setq exec-path (append exec-path '("/Users/jchang/.nvm/versions/node/v8.11.4/bin")))

;;   (setq ns-use-thin-smoothing t)    ; thinner strokes for font-smoothing
;;   (setq dired-use-ls-dired nil)

;;   ;; macOS natural title bars
;;   (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
;;   (add-to-list 'default-frame-alist '(ns-appearance . dark)))
(help/on-mac-os
 (use-package exec-path-from-shell
  :ensure t
  :config
  ;; thinner strokes for font-smoothing
  (setq ns-use-thin-smoothing t)
  (setq dired-use-ls-dired nil)
  ;; macOS natural title bars
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))

  (setq exec-path-from-shell-check-startup-files nil)
  (setq exec-path-from-shell-debug 1)
  (exec-path-from-shell-initialize)))
