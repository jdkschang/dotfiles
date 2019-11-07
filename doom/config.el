;;; ~/projects/jdkschang/dotfiles/doom/config.el -*- lexical-binding: t; -*-

;; (defvar xdg-data (getenv "XDG_DATA_HOME"))
;; (defvar xdg-bin (getenv "XDG_BIN_HOME"))
;; (defvar xdg-cache (getenv "XDG_CACHE_HOME"))
;; (defvar xdg-config (getenv "XDG_CONFIG_HOME"))

(server-start)
(setq user-full-name    "Jonathan D. Chang"
      user-mail-address "jdkschang@apple.com"
      epa-file-encrypt-to user-mail-address

      ;; On-demand code completion turned off
      ;; company-idle-delay nil

      doom-large-file-size 1

      ;; lsp-ui-sideline is redundant with eldoc and more invasive
      ;; disable by default
      lsp-ui-sideline-enable nil
      lsp-enable-indentation nil
      lsp-enable-on-type-formatting nil
      lsp-enable-symbol-highlighting nil

      +pretty-code-enabled-modes '(emacs-lisp-mode org-mode)
      +format-on-save-enabled-modes '(not emacs-lisp-mode))

;;; Frames/Windows
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

;; henrik code snippet
;; patch for workspaces to not load correctly on session reload
(after! persp-mode
  (remove-hook 'persp-filter-save-buffers-functions #'buffer-live-p)

  (defun +workspaces-dead-buffer-p (buf)
    (not (buffer-live-p buf)))
  (add-hook 'persp-filter-save-buffers-functions #'+workspaces-dead-buffer-p))

;; <gs SPC> works across all visible windows
;; useful for jumping around the screen
(setq avy-all-windows t)

(add-hook 'prog-mode-hook #'goto-address-mode) ;; Linkify links!
;; (add-hook 'prog-mode-hook #'global-origami-mode)

;; lang/sh
;; setup flycheck-checkbashisms
;; flycheck checker for checking files beginning with #!/bin/sh
;; which also contain code exclusive to bash requires: checkbashism
(use-package! flycheck-checkbashisms
  :when (and (featurep! :feature syntax-checker)(featurep! :lang sh))
  :after sh-mode
  :hook (flycheck-mode . flycheck-checkbashisms-setup))

;; Load snippets
(after! yasnippet
  (push (expand-file-name "snippets/" doom-private-dir) yas-snippet-dirs))

;; Modules
(load! "+ui") ;; My ui mods. Also contains ligature stuff.
(load! "+magit")
(load! "+theme")
(load! "+macos")
(load! "+org") ;; Org mode stuff like todos and rebindings
(load! "+bindings")
