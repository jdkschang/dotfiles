;;; ~/projects/jdkschang/dotfiles/doom/+magit.el -*- lexical-binding: t; -*-

(after! magit
  (setq magit-repository-directories '(("~/projects" . 2))
        magit-save-repository-buffers nil
        ;; don't restore the wconf after quitting magit
        magit-inhibit-save-previous-winconf t
        transient-values '((magit-commit "--gpg-sign=50C3D91E4C96CE4A")
                           (magit-rebase "--autosquash" "--gpg-sign=50C3D91E4C96CE4A")
                           (magit-pull   "--rebase" "--gpg-sign=50C3D91E4C96CE4A"))
        +magit-hub-features t ;; I want the PR/issue stuff too!
        +magit-hub-enable-by-default t))  ;; And I want it on by default!

(after! forge
  (add-to-list 'forge-alist '("github.pie.apple.com" "api.github.pie.apple.com" "github.pie.apple.com" forge-github-repository)))
