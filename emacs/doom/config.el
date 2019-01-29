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

							;; <gs SPC> works across all visible windows
							;; useful for jumping around the screen
							avy-all-windows t

							+workspaces-switch-project-function #'ignore
							;; Create a new workspace when switching projects.
							+workspaces-on-switch-project-behavior t
							+pretty-code-enabled-modes '(emacs-lisp-mode org-mode)
							+format-on-save-enabled-modes '(not emacs-lisp-mode))

(add-to-list 'org-modules 'org-habit t)

(add-hook 'prog-mode-hook #'goto-address-mode) ;; Linkify links!
(add-hook 'prog-mode-hook #'global-origami-mode)

;; Load snippets
(after! yasnippet
	(push (expand-file-name "snippets/" doom-private-dir) yas-snippet-dirs))

(def-package! ivy-yasnippet
  :commands (ivy-yasnippet)
  :config
  (map!
   (:leader
     (:prefix "s"
       :desc "Ivy-yasnippet" :n "y" #'ivy-yasnippet))))

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
; (load! "+tramp")
																				; (load! "+reason") ;; ReasonML stuff
(load! "+org") ;; Org mode stuff like todos and rebindings
(load! "+bindings")
