;;; ~/dotfiles/dots/emacs/doom/+magit.el -*- lexical-binding: t; -*-

(after! magit
	(magit-wip-after-save-mode t)
	(magit-wip-after-apply-mode t)
	(setq magit-save-repository-buffers nil
				magit-repository-directories '(("~/Dropbox/Projects/" . 3)
																			 ("~/Projects/" . 3)
																			 ("~/dotfiles/" . 0))
				magit-commit-arguments '("--gpg-sign=D1BDD1F5AA60F93E")
				magit-rebase-arguments '("--autostash" "--gpg-sign=D1BDD1F5AA60F93E")
				magit-pull-arguments   '("--rebase" "--autostash" "--gpg-sign=D1BDD1F5AA60F93E")
				magit-display-file-buffer-function #'switch-to-buffer-other-window
				magithub-clone-default-directory "~/Dropbox/Projects" ;; I want my stuff to clone to ~/projects
				+magit-hub-features t ;; I want the PR/issue stuff too!
				+magit-hub-enable-by-default t))  ;; And I want it on by default!
