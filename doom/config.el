;;; config.el -*- lexical-binding: t; -*-

(server-start)
(setq user-full-name    "Jonathan D. Chang"
      user-mail-address "jdkschang@apple.com"
      epa-file-encrypt-to user-mail-address

      auth-sources '("~/.authinfo.gpg")
      auth-source-cache-expiry nil

      ;; Line numbers are pretty slow all around. The performance boost of
      ;; disabling them outweighs the utility of always keeping them on.
      display-line-numbers-type nil

      doom-fallback-buffer-name "► Doom"
      +doom-dashboard-name "► Doom"
      ;; doom-large-file-size 1
      doom-scratch-initial-major-mode 'lisp-interaction-mode
      ;; doom-scratch-buffer-major-mode 'org-mode

      ;; lsp-ui-sideline is redundant with eldoc and more invasive
      ;; disable by default
      lsp-ui-sideline-enable nil
      lsp-enable-symbol-highlighting nil

      evil-ex-substitute-global t

      projectile-project-search-path '("~/projects/jdkschang" "~/projects/apple"))

(use-package! atomic-chrome
  :after-call focus-out-hook
  :config
  (setq atomic-chrome-default-major-mode 'markdown-mode
        atomic-chrome-buffer-open-style 'frame)
  (atomic-chrome-start-server))


;;
;;;; UI

(setq treemacs-width 32
      doom-theme 'doom-dracula
      doom-font (font-spec :family "MonoLisa" :size 13)
      doom-variable-pitch-font (font-spec :family "Operator Mono SSm" :slant 'italic :size 13))


;; Prevents some cases of Emacs flickering
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))


;;
;;; Keybinds

(map! :n [tab] (cmds! (and (featurep! :editor fold)
                           (save-excursion (end-of-line) (invisible-p (point))))
                      #'+fold/toggle
                      (fboundp 'evil-jump-item)
                      #'evil-jump-item)
      :v [tab] (cmds! (and (bound-and-true-p yas-minor-mode)
                           (or (eq evil-visual-selection 'line)
                               (not (memq (char-after) (list ?\( ?\[ ?\{ ?\} ?\] ?\))))))
                      #'yas-insert-snippet
                      (fboundp 'evil-jump-item)
                      #'evil-jump-item)

      :leader
      "h L" #'global-keycast-mode
      "f t" #'find-in-dotfiles
      "f T" #'browse-dotfiles)


;;
;;; Modules

(after! ivy
  ;; I prefer search matching to be ordered; it's more precise
  (add-to-list 'ivy-re-builders-alist '(counsel-projectile-find-file . ivy--regex-plus)))

;; Switch to the new window after splitting
(setq evil-split-window-below t
      evil-vsplit-window-right t)


;;;; :tools magit
(after! magit
  (setq magit-repository-directories '(("~/projects" . 2))
        magit-save-repository-buffers nil
        ;; don't restore the wconf after quitting magit
        magit-inhibit-save-previous-winconf t
        transient-values '((magit-fetch  "--prune")
                           (magit-commit "--gpg-sign=50C3D91E4C96CE4A")
                           (magit-rebase "--autostash" "--interactive" "--gpg-sign=50C3D91E4C96CE4A")
                           (magit-pull   "--rebase" "--gpg-sign=50C3D91E4C96CE4A"))))

;;;; config to pipe into apple's repos
(after! forge
  (add-to-list 'forge-alist '("github.pie.apple.com" "api.github.pie.apple.com" "github.pie.apple.com" forge-github-repository)))


;;; :lang org
(setq org-directory "~/projects/org/"
      org-archive-location (concat org-directory ".archive/%s::")
      org-roam-directory (concat org-directory "notes/")
      org-roam-db-location (concat org-roam-directory ".org-roam.db")
      org-journal-encrypt-journal t
      org-journal-file-format "%Y%m%d.org"
      org-startup-folded 'overview
      org-ellipsis " [...] ")


;;; :ui doom-dashboard
(setq fancy-splash-image (concat doom-private-dir "splash.png"))
;; Don't need the menu; I know them all by heart
;; (remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)


;;
;;; Language customizations

(custom-theme-set-faces! 'doom-dracula
  `(markdown-code-face :background ,(doom-darken 'bg 0.075))
  `(font-lock-variable-name-face :foreground ,(doom-lighten 'magenta 0.6)))
