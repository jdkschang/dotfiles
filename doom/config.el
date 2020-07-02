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
      doom-scratch-buffer-major-mode 'org-mode

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

      projectile-project-search-path '("~/projects/jdkschang" "~/projects/apple")

      +pretty-code-enabled-modes '(emacs-lisp-mode org-mode)
      +format-on-save-enabled-modes '(not emacs-lisp-mode))

;;; Frames/Windows
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

(use-package! zetteldeft
  :after deft)


;; henrik code snippet
;; patch for workspaces to not load correctly on session reload
(after! persp-mode
  (remove-hook 'persp-filter-save-buffers-functions #'buffer-live-p)

  (defun +workspaces-dead-buffer-p (buf)
    (not (buffer-live-p buf)))
  (add-hook 'persp-filter-save-buffers-functions #'+workspaces-dead-buffer-p))

(add-hook 'prog-mode-hook #'goto-address-mode) ;; Linkify links!
(add-hook 'after-init-hook #'global-emojify-mode) ;; Enable emojis

;; Load snippets
(after! yasnippet
  (push (expand-file-name "snippets/" doom-private-dir) yas-snippet-dirs))

;; Trying to be more friendly for .ts & .tsx files
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))
(after! typescript-mode
  (require 'web-mode)
  (add-hook 'typescript-mode-hook #'flycheck-mode))

(setq +set-eslint-checker nil)
(after! lsp-ui
  ;; for w/e reason this is running twice
  (setq lsp-ui-sideline-show-hover t)
  (when (not +set-eslint-checker)
    (progn
      (setq +set-eslint-checker t)
      (flycheck-add-mode 'javascript-eslint 'web-mode)
      (flycheck-add-next-checker 'lsp-ui '(warning . javascript-eslint)))))

(after! web-mode
  (add-hook 'web-mode-hook #'flycheck-mode)
  (setq web-mode-markup-indent-offset 4
        web-mode-code-indent-offset 4
        web-mode-enable-auto-quoting nil
        web-mode-auto-close-style 2))

(after! lsp
  ;; These take up a lot of space on my big font size
  (setq lsp-ui-sideline-show-code-actions nil
        lsp-ui-sideline-show-diagnostics nil
        lsp-signature-render-all nil))

(after! web-mode
  (remove-hook 'web-mode-hook #'+javascript-init-lsp-or-tide-maybe-h)
  (add-hook 'web-mode-local-vars-hook #'+javascript-init-lsp-or-tide-maybe-h))

;; Modules
(load! "+ui") ;; My ui mods. Also contains ligature stuff.
(load! "+magit")
(load! "+theme")
(load! "+macos")
(load! "+org") ;; Org mode stuff like todos and rebindings
(load! "+bindings")
