;; -*- no-byte-compile: t; -*-
;;; ~/dotfiles/dots/emacs/doom/packages.el

;; Misc stuff
;; Can highlight a region and hit M-x carbon-now-sh to get a https://carbon.now
;; of the region
(package! carbon-now-sh)

;; JS stuff
(package! prettier-js)
(package! pkgbuild-mode)

;; Fuzzy searching
(package! flx)

;; Filestuff
(package! ranger)

;; Reasonml stuff
(package! reason-mode)

;; Better folds
(package! origami)
(package! move-text)
(package! org-fancy-priorities)


;; Fixing matchit autoloads error
(package! evil-matchit :recipe (:fetcher github :repo "redguardtoo/evil-matchit" :commit "7d65b4167b1f0086c2b42b3aec805e47a0d355c4"))
