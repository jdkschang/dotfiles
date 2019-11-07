;; -*- no-byte-compile: t; -*-
;;; ~/dotfiles/dots/emacs/doom/packages.el

;; feature/snippets
(package! yasnippet-snippets)

;; lang/sh
(package! flycheck-checkbashisms)

;; tools/tldr
(package! tldr)

;; Better folds
(package! origami)

(package! move-text)

;; Better window sizing
(package! golden-ratio)

(use-package forge
  :after magit)
;; (use-package lsp-python-ms
;;   :ensure t
;;   :hook (python-mode . (lambda ()
                         ;; (require 'lsp-python-ms)
                         ;; (lsp))))
