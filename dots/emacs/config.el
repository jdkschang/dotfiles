;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-
(setq-default evil-shift-width 2
			  tab-width 2)

(delq 'rg +helm-project-search-engines) ;; rg is buggy, prefer ag

(def-package! prettier-js
  :commands (prettier-js-mode)
  :init
  (defun setup-prettier-js ()
	"Sets up arguments and the mode."
	(interactive)
	(setq prettier-js-args '("--single-quote"))

	(prettier-js-mode))
  (add-hook! (typescript-mode
			  js2-mode)
	#'setup-prettier-js)
  (add-hook! web-mode (enable-minor-mode '("\\.tsx\\'" . setup-prettier-js))))

(after! typescript-mode
  (add-hook 'typescript-mode-hook #'flycheck-mode)
  (setq typescript-indent-level 2))


(after! js2-mode
  ;; use eslintd-fix to fix on save
  (add-hook 'js2-mode-hook #'eslintd-fix-mode)

  ;; indents
  (setq js2-basic-offset 2))

(after! web-mode
  (add-hook 'web-mode-hook #'flycheck-mode)

  (setq web-mode-markup-indent-offset 2 ;; indents
		web-mode-code-indent-offset 2
		web-mode-enable-auto-quoting nil ;; disabling adding "" after =
		web-mode-auto-close-style 3)) ;; RJSX-mode style closing

(after! helm
  (add-hook! 'helm-find-files-after-init-hook
	(map! :map helm-find-files-map
		  "<DEL>" #'helm-find-files-up-one-level)))


;; Modules
(load! "+ui") ;; ui mods; fonts & ligature
(load! "+magit")
