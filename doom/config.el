;;; config.el -*- lexical-binding: t; -*-

(server-start)
(setq user-full-name    "Jonathan D. Chang"
      user-mail-address "jdkschang@apple.com"
      epa-file-encrypt-to user-mail-address

      ;; Line numbers are pretty slow all around. The performance boost of
      ;; disabling them outweighs utility of keeping them on.
      display-line-numbers-type nil

      ;; On-demand code completion turned off
      company-idle-delay nil

      doom-large-file-size 1

      ;; lsp-ui-sideline is redundant with eldoc and more invasive
      ;; disable by default
      lsp-ui-sideline-enable nil
      lsp-enable-indentation nil
      lsp-enable-on-type-formatting nil
      lsp-enable-symbol-highlighting nil
      lsp-enable-file-watchers nil

      ;; Disable help mouse-overs for mode-line segments (i.e. :help-echo text)
      ;; Generally unhelpful and adds confusing visual clutter
      mode-line-default-help-echo nil
      show-help-function nil

      ;; <gs SPC> works across all visible windows
      ;; useful for jumping around the screen
      avy-all-windows t

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

(add-hook 'prog-mode-hook #'goto-address-mode) ;; Linkify links!

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
