;;; ~/dotfiles/dots/emacs/doom/+ui.el -*- lexical-binding: t; -*-

;; Setting transparency values
(defvar solid 100)
(defvar transparent 88)

;; hotswap between transparencies
(defun +jdkschang/toggle-transparency ()
  (interactive)
  (cond
   ((eq (frame-parameter nil 'alpha) solid)
    (message "Toggling to transparent: %s" transparent)
    (doom/set-frame-opacity transparent))

   ((eq (frame-parameter nil 'alpha) transparent)
    (message "Toggling to solid: %s" solid)
    (doom/set-frame-opacity solid))

   (t (message "Can't toggle transparency."))))

(doom/set-frame-opacity transparent)

;; Font
(setq doom-font (font-spec :family "MonoLisa" :size 13)
      doom-big-font (font-spec :family "MonoLisa" :size 20)
      doom-variable-pitch-font (font-spec :family "Operator Mono SSm" :slant 'italic :size 13)
      doom-serif-font (font-spec :family "IBM Plex Mono" :weight 'light))

(defun +jdkschang/italicize-comments ()
  (set-face-italic 'font-lock-comment-face t))

(add-hook 'doom-load-theme-hook #'+jdkschang/italicize-comments)

(after! text-mode
  (add-hook! 'text-mode-hook
    ;; Apply ANSI color codes
    (with-silent-modifications
      (ansi-color-apply-on-region (point-min) (point-max)))))

;; make red modeline text orange, so it doesn't feel like something's wrong
(custom-set-faces!
  '(doom-modeline-buffer-modified :foreground "orange"))

(defun doom-modeline-conditional-buffer-encoding ()
  "We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case"
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))

(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)

;; there's a bug with the modeline in insert mode for org documents
;; src: https://github.com/seagle0128/doom-modeline/issues/300
(custom-set-faces! '(doom-modeline-evil-insert-state :weight bold :foreground "#339CDB"))


;; Centaur Tabs
(after! centaur-tabs
  (centaur-tabs-mode -1)
  (setq centaur-tabs-height 36
        centaur-tabs-set-icons t
        centaur-tabs-modified-marker "o"
        centaur-tabs-close-button "×"
        centaur-tabs-set-bar 'above
        centaur-tabs-gray-out-icons 'buffer))
  ;; (centaur-tabs-change-fonts "P22 Underground Book" 160))
;; (setq x-underline-at-descent-line t)
