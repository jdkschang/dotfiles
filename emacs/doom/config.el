;;; ~/dotfiles/dots/emacs/doom/config.el -*- lexical-binding: t; -*-

;;;;
;;;; General Settings
;;;;
;; (setq debug-on-error t)

;; Make Doom shut up about recentf-cleanup
(advice-add #'recentf-cleanup :around #'doom*shut-up)

(setq-default user-full-name    "Dmitri Chang"
							user-mail-address "jdkschang@protonmail.com"
							fill-column 100
							doom-leader-key "SPC"
							doom-localleader-key ","

							evil-shift-width 4
							tab-width 4

							+workspaces-switch-project-function #'ignore
							;; Create a new workspace when switching projects.
							+workspaces-on-switch-project-behavior t
							+pretty-code-enabled-modes '(emacs-lisp-mode org-mode)
							+format-on-save-enabled-modes '(not emacs-lisp-mode))

;; <gs SPC> works across all visible windows
;; useful for jumping around the screen
(setq avy-all-windows t)

(add-hook 'prog-mode-hook #'goto-address-mode) ;; Linkify links!
(add-hook 'prog-mode-hook #'global-origami-mode)
(add-hook 'prog-mode-hook #'golden-ratio-mode)

;; setup company-perscient
(def-package! company-prescient
	:after company
	:hook (company-mode . company-prescient-mode))

;; setup company ui
(after! company
	(setq company-tooltip-limit 5
				company-tooltip-minimum-width 80
				company-tooltip-minimum 5
				company-backends
				'(company-capf company-dabbrev company-files company-yasnippet)
				company-global-modes '(not comint-mode erc-mode message-mode help-mode gud-mode)))

;; emacs/term
;; set fish as my default shell
(after! multi-term
	(setq multi-term-program "/usr/local/bin/fish"))

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

;; (def-package! parinfer
;; 	:bind (("C-," . parinfer-toggle-mode))
;; 	:hook ((clojure-mode emacs-lisp-mode common-lisp-mode) . parinfer-mode)
;; 	:config (setq parinfer-extensions '(defaults pretty-parens evil paredit)))

(def-package! prettier-js
	:commands (prettier-js-mode)
	:init
	(defun setup-prettier-js ()
		"Sets up arguments and the mode."
		(interactive)
		(setq prettier-js-args '("--single-quote --no-semi --jsx-bracket-same-line"))
		(prettier-js-mode))

	(add-hook! (typescript-mode
							js2-mode)
		#'setup-prettier-js)
	(add-hook! web-mode (enable-minor-mode '("\\.tsx\\'" . setup-prettier-js))))

(after! typescript-mode
	(add-hook 'typescript-mode-hook #'flycheck-mode)
	(setq typescript-indent-level 2))

(after! js2-mode
	;; use eslintd-fix so when i save it fixes dumb shit
	(add-hook 'js2-mode-hook #'eslintd-fix-mode)
	(setq flycheck-javascript-standard-executable "~/.nvm/versions/node/v8.11.4/bin/standard")
	;; (set-pretty-symbols! '(js2-mode) nil)
	;; Indent shit
	(setq js2-basic-offset 2))

(after! rjsx-mode
	(setq flycheck-javascript-standard-executable "~/.nvm/versions/node/v8.11.4/bin/standard"))
;; (set-pretty-symbols! '(rjsx-mode) nil))

(defun enable-minor-mode (my-pair)
	"Enable minor mode if filename matches the regexp.
	MY-PAIR is a cons cell (regexp . minor-mode)."
	(if (buffer-file-name)
			(if (string-match (car my-pair) buffer-file-name)
					(funcall (cdr my-pair)))))

(after! web-mode
	(add-hook 'web-mode-hook #'flycheck-mode)

	(setq web-mode-markup-indent-offset 2 ;; Indentation
				web-mode-code-indent-offset 2
				web-mode-enable-auto-quoting nil ;; disbale adding "" after an =
				web-mode-auto-close-style 3)) ;; RJSX-mode style closing

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

;;;
;;; Fixes

;; I dislike Emacs asking me if I'm sure I want to quit with sub-processes running.
;; (defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
;; 	(cl-letf (((symbol-function #'process-list) (lambda ())))
		;; ad-do-it))


;; Modules
(load! "+ui") ;; My ui mods. Also contains ligature stuff.
(load! "+theme")
(load! "+macos")
(load! "+ranger") ;; File manager stuff
(load! "+tramp")
																				; (load! "+reason") ;; ReasonML stuff
(load! "+org") ;; Org mode stuff like todos and rebindings
(load! "+bindings")
