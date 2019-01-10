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
							doom-localleader-key ",")

;; whitespace-mode
;; http://stackoverflow.com/questions/6378831/emacs-globally-enable-whitespace-mode
;; (global-whitespace-mode 1)
;; http://ergoemacs.org/emacs/whitespace-mode.html
;; http://ergoemacs.org/emacs/emacs_delete_trailing_whitespace.html
(setq whitespace-style (quote
												(face tabs trailing empty)))


(setq-default evil-shift-width 2 ;; I normally use 2wide for my projects.
							tab-width 2)

(delq 'rg +helm-project-search-engines) ;; rg is kinda buggy, and i prefer ag

(add-hook 'prog-mode-hook #'goto-address-mode) ;; Linkify links!
;; (add-hook 'prog-mode-hook #'parinfer-toggle-mode)
(add-hook 'prog-mode-hook #'global-origami-mode)

;; Load snippets
(after! yasnippet
	(push (expand-file-name "snippets/" doom-private-dir) yas-snippet-dirs))

(def-package! parinfer
	:bind (("C-," . parinfer-toggle-mode))
	:hook ((clojure-mode emacs-lisp-mode common-lisp-mode) . parinfer-mode)
	:config (setq parinfer-extensions '(defaults pretty-parens evil paredit)))

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

(after! helm
	;; I want backspace to go up a level, like ivy
	(add-hook! 'helm-find-files-after-init-hook
		(map! :map helm-find-files-map
					"<DEL>" #'helm-find-files-up-one-level)))
;;;
;;; Fixes

;; I dislike Emacs asking me if I'm sure I want to quit with sub-processes running.
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
	(cl-letf (((symbol-function #'process-list) (lambda ())))
		ad-do-it))

;; Create a new workspace when switching projects.
(setq +workspaces-on-switch-project-behavior t)

;; Modules
(load! "+ui") ;; My ui mods. Also contains ligature stuff.
(load! "+theme")
(load! "+macos")
; (load! "+ranger") ;; File manager stuff
; (load! "+reason") ;; ReasonML stuff
(load! "+org") ;; Org mode stuff like todos and rebindings
(load! "+bindings")
