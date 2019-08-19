;;; ~/dotfiles/dots/emacs/doom/config.el -*- lexical-binding: t; -*-

;; (defvar xdg-data (getenv "XDG_DATA_HOME"))
;; (defvar xdg-bin (getenv "XDG_BIN_HOME"))
;; (defvar xdg-cache (getenv "XDG_CACHE_HOME"))
;; (defvar xdg-config (getenv "XDG_CONFIG_HOME"))

(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

(server-start)
(setq-default user-full-name    "Jonathan D. Chang"
              user-mail-address "jdkschang@protonmail.com"

              doom-localleader-key ","
              ;; evil-shift-width 4
              ;; tab-width 4

              +workspaces-switch-project-function #'ignore
              +pretty-code-enabled-modes '(emacs-lisp-mode org-mode)
              +format-on-save-enabled-modes '(not emacs-lisp-mode))

;;
;;; Host-specific config
(pcase (system-name)
  ("kukan"
   ;; hlissner's swapped keys
   (setq x-super-keysym 'meta
         x-meta-keysm 'super))
  ("geesee"
   (font-put doom-font size: 16)))

;; <gs SPC> works across all visible windows
;; useful for jumping around the screen
(setq avy-all-windows t)

;; gpg security
(setq auth-sources
      '((:source "~/.config/gpg/authinfo.gpg")))
(setq epa-pinentry-mode 'loopback)
;; (pinentry-start)

(defadvice epg--start (around advice-epg-disable-agent disable)
  "Don't allow epg--start to use gpg-agent in plain text
        terminals."
  (if (display-graphic-p)
      ad-do-it
    (let ((agent (getenv "GPG_AGENT_INFO")))
      (setenv "GPG_AGENT_INFO" nil) ; give us a usable text password prompt
      ad-do-it
      (setenv "GPG_AGENT_INFO" agent))))
(ad-enable-advice 'epg--start 'around 'advice-epg-disable-agent)
(ad-activate 'epg--start)

(add-hook 'prog-mode-hook #'goto-address-mode) ;; Linkify links!
(add-hook 'prog-mode-hook #'global-origami-mode)
;; (add-hook 'prog-mode-hook #'golden-ratio-mode)

;; emacs/term
;; set fish as my default shell

;; lang/sh
;; setup flycheck-checkbashisms
;; flycheck checker for checking files beginning with #!/bin/sh
;; which also contain code exclusive to bash requires: checkbashism
(def-package! flycheck-checkbashisms
  :when (and (featurep! :feature syntax-checker)(featurep! :lang sh))
  :after sh-mode
  :hook (flycheck-mode . flycheck-checkbashisms-setup))

;; Load snippets
(after! yasnippet
  (push (expand-file-name "snippets/" doom-private-dir) yas-snippet-dirs))

;; ;; emacs/eshell
(after! eshell
  (set-eshell-alias!
   "f"   "find-file $1"
   "l"   "ls -lh"
   "d"   "dired $1"
   "gl"  "(call-interactively 'magit-log-current)"
   "gs"  "magit-status"
   "gc"  "magit-commit"
   "rg"  "rg --color=always $*")

  ;; remove modeline in eshell buffers
  (add-hook 'eshell-mode-hook #'hide-mode-line-mode))

;; Modules
(load! "+ui") ;; My ui mods. Also contains ligature stuff.
(load! "+magit")
(load! "+theme")
(load! "+macos")
(load! "+org") ;; Org mode stuff like todos and rebindings
(load! "+bindings")
