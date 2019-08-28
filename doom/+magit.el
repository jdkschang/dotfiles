;;; ~/projects/jdkschang/dotfiles/doom/+magit.el -*- lexical-binding: t; -*-

(after! magit
  (setq magit-save-repository-buffers nil
        magit-repository-directories '(("~/projects" . 3))
        transient-values '((magit-commit "--gpg-sign=F25BE343AF08C240")
                           (magit-rebase "--autosquash" "--gpg-sign=F25BE343AF08C240")
                           (magit-pull   "--rebase" "--gpg-sign=F25BE343AF08C240"))
        +magit-hub-features t ;; I want the PR/issue stuff too!
        +magit-hub-enable-by-default t))  ;; And I want it on by default!
