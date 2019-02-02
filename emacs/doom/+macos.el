;;; ~/dotfiles/dots/emacs/doom/+macos.el -*- lexical-binding: t; -*-

;;;;
;;;; macOS specific settings
;;;;

; (defmacro help/on-mac-os (statement &rest statements)
;   "Evaluate the enclosed body only when run on macOS."
;   `(when (eq system-type 'darwin)
;      ,statement
;      ,@statements))

(when IS-MAC       ; should be the same as (when IS-MAC...)
   (setq exec-path (append exec-path '("~/.config/nvm/versions/node/11.9.0/bin")))
   (setq ns-use-thin-smoothing t)    ; thinner strokes for font-smoothing
   (setq dired-use-ls-dired nil)

   ;; macOS natural title bars
   (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
   (add-to-list 'default-frame-alist '(ns-appearance . dark)))
   ;; (add-hook 'window-setup-hook #'toggle-frame-maximized))

; (help/on-mac-os
;  (use-package exec-path-from-shell
;   :ensure t
;   :config
;   (setq exec-path-from-shell-check-startup-files nil)
;   (setq exec-path-from-shell-debug 1)
;   (exec-path-from-shell-initialize)))

; (help/on-mac-os
;   ;; thinner strokes for font-smoothing
;   (setq ns-use-thin-smoothing t)
;   (setq dired-use-ls-dired nil)
;   ;; macOS natural title bars
;   (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
;   (add-to-list 'default-frame-alist '(ns-appearance . dark)))

; (help/on-mac-os
;  (defun help/yes-or-no-p (orig-fun &rest args)
;    "Prevent yes-or-no-p from activating a dialog."
;    (let ((use-dialog-box nil))
;      (apply orig-fun args)))
;  (advice-add #'yes-or-no-p :around #'help/yes-or-no-p)
;  (advice-add #'y-or-n-p :around #'help/yes-or-no-p))
