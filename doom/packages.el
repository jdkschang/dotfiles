;; -*- no-byte-compile: t; -*-
;;; ~/dotfiles/dots/emacs/doom/packages.el

;; feature/snippets
(package! yasnippet-snippets)

;; tools/tldr
(package! tldr)

;; Better folds
(package! origami)

(package! emojify)
(package! move-text)

;; Better window sizing
(package! golden-ratio)
(package! rotate :pin "091b5ac4fc...")

(package! deft)
(package! zetteldeft)

(package! git-timemachine)

;; alleviate some issues w/ flyspell
(package! flyspell-lazy :pin "3ebf68cc9e...")

;; makes manual pages nicer to look at
(package! info-colors :pin "47ee73cc19...")

(package! org-super-agenda :pin "dd0d104c26...")
;; (Declarative Org Capture Templates) seems to be a nicer way to set up org-capture
(package! doct
  :recipe (:host github :repo "progfolio/doct")
  :pin "9be788f9e3...")
(package! org-fragtog :pin "3eea7f1708...")
(package! org-pretty-table-mode
  :recipe (:host github :repo "Fuco1/org-pretty-table") :pin "88380f865a...")
(package! org-pretty-tags :pin "40fd72f3e7...")
(package! ox-gfm :pin "99f93011b0...")
(package! org-graph-view :recipe (:host github :repo "alphapapa/org-graph-view") :pin "13314338d7...")
(package! org-chef :pin "1dd73fd3db...")
(package! org-roam-server :pin "7617ac01a1...")
(package! systemd :pin "51c148e09a...")
