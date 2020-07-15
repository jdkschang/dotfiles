;;; config.el -*- lexical-binding: t; -*-

(server-start)
(setq user-full-name    "Jonathan D. Chang"
      user-mail-address "jdkschang@apple.com"
      epa-file-encrypt-to user-mail-address

      auth-sources '("~/.authinfo.gpg")
      auth-source-cache-expiry nil
      display-line-numbers-type 'relative

      undo-limit 80000000 ; Raise undo-limit to 80Mb
      evil-want-fine-undo t
      auto-save-default t
      inhibit-compacting-font-caches t
      truncate-string-ellipsis "…"

      doom-fallback-buffer-name "► Doom"
      +doom-dashboard-name "► Doom"
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

      +ivy-buffer-preview t
      ivy-read-action-function #'ivy-hydra-read-action
      ivy-sort-max-size 50000
      ;; <gs SPC> works across all visible windows
      ;; useful for jumping around the screen
      avy-all-windows t

      projectile-project-search-path '("~/projects/jdkschang" "~/projects/apple")

      +pretty-code-enabled-modes '(emacs-lisp-mode org-mode)
      +format-on-save-enabled-modes '(not emacs-lisp-mode))

(setq-default
 delete-by-moving-to-trash t
 tab-width 4
 uniquify-buffer-name-style 'forward
 window-combination-resize t
 x-stretch-cursor t
 major-mode 'org-mode)


;;; Frames/Windows
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

(delete-selection-mode 1)                         ; Replace selection when inserting text
(display-time-mode 1)                             ; Enable time in the mode-line
(unless (equal "Battery status not avalible"
               (battery))
  (display-battery-mode 1))                       ; On laptops it's nice to know how much power you have
(global-subword-mode 1)                           ; Iterate through CamelCase words


(after! company
  ;; On-demand code completion turned off
  (setq company-idle-delay 0.5
       company-minimum-prefix-length 2
       company-show-numbers t)

  (add-hook 'evil-normal-state-entry-hook #'company-abort))

(set-company-backend! '(text-mode
                        markdown-mode
                        gfm-mode)
  '(:seperate company-ispell
              company-files
              company-yasnippet))

(setq-default history-length 1000)
(setq-default prescient-history-length 1000)

(after! lsp-python-ms
  (set-lsp-priority! 'mspyls 1))

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

(add-hook! (gfm-mode markdown-mode) #'mixed-pitch-mode)

(after! flyspell (require 'flyspell-lazy) (flyspell-lazy-mode 1))

(use-package! info-colors
  :commands (info-colors-fontify-node))

(add-hook 'Info-selection-hook 'info-colors-fontify-node)

(add-hook 'Info-mode-hook #'mixed-pitch-mode)

(setq ledger-mode-should-check-version nil
      ledger-report-links-in-register nil
      ledger-binary-path "hledger")

(setq authinfo-keywords
      '(("^#.*" . font-lock-comment-face)
        ("^\\(machine\\) \\([^ \t\n]+\\)"
         (1 font-lock-variable-name-face)
         (2 font-lock-builtin-face))
        ("\\(login\\) \\([^ \t\n]+\\)"
         (1 font-lock-keyword-face)
         (2 font-lock-string-face))
        ("\\(password\\) \\([^ \t\n]+\\)"
         (1 font-lock-constant-face)
         (2 font-lock-doc-face))
        ("\\(port\\) \\([^ \t\n]+\\)"
         (1 font-lock-type-face)
         (2 font-lock-type-face))))

(define-derived-mode authinfo-mode fundamental-mode "authinfo"
  "Major mode for editing the authinfo file."
  (font-lock-add-keywords nil authinfo-keywords)
  (setq-local comment-start "#")
  (setq-local comment-end ""))

(provide 'authinfo-mode)
(use-package! authinfo-mode
  :mode ("authinfo\\.gpg\\'" . authinfo-mode))


;; Modules
(load! "+ui") ;; My ui mods. Also contains ligature stuff.
(load! "+magit")
(load! "+theme")
(load! "+macos")
(load! "+org") ;; Org mode stuff like todos and rebindings
(load! "+bindings")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(deft-auto-save-interval -1.0)
 '(deft-default-extension "org" t)
 '(deft-directory "~/Dropbox/3 Resources/org-roam/")
 '(deft-recursive t)
 '(deft-use-filter-string-for-filename t)
 '(org-journal-date-format "%A, %d %B %Y")
 '(org-journal-date-prefix "#+TITLE: ")
 '(org-journal-dir "~/Dropbox/3 Resources/org-roam/")
 '(org-journal-file-format "%Y-%m-%d.org")
 '(package-selected-packages '(org-roam-server)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doom-modeline-buffer-modified ((t (:foreground "orange"))))
 '(doom-modeline-evil-insert-state ((t (:weight bold :foreground "#339CDB"))))
 '(org-document-title ((t (:height 1.2)))))
