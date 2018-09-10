;;; ~/.doom.d/+magit.el -*- lexical-binding: t; -*-

(setq +magit-hub-features t ;; PR/ issue stuffs
	  +magit-hub-enable-by-default t) ;; on default

(after! magit
  (magit-wip-after-save-mode t)
  (magit-wip-after-apply-mode t)
  (setq magit-save-repository-buffers 'dontask
		magit-repository-directories '(("~/Dropbox/Projects/" . 3)
									   ("~/Projects" . 3)
									   ("~/dotfiles/" . 0))
		magit-popup-display-buffer-action nil ;; ATTN: why is this here?
		magit-display-file-buffer-function #'switch-to-buffer-other-window
		magithub-clone-default-directory "~/Dropbox/Projects")) ;; clone into ~/Dropbox/Projects
