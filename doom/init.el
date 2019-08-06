;;; init.el -*- lexical-binding: t; -*-

(doom! :completion
			 (company +auto)
			 (helm +auto +fuzzy)

			 :ui
			 doom
			 doom-dashboard
			 hl-todo
			 indent-guides
			 modeline
			 nav-flash
			 ophints
			 treemacs
			 (popup +all +defaults)
			 (pretty-code +fira)

			 vc-gutter
			 vi-tilde-fringe
			 window-select
			 workspaces

			 :editor
			 (evil +everywhere)
			 file-templates
			 fold
			 (format +onsave)
			 multiple-cursors
			 ;; parinfer
			 rotate-text       ; cycle region at point between text candidates
			 snippets

			 :emacs
			 dired
			 electric          ; smarter, keyword-based electric-indent
			 vc                ; version-control and Emacs, sitting in a tree

			 :term
			 ;; eshell
			 ;; shell
			 ;; term
			 ;; vterm

			 :tools
			 ;; debugger
			 direnv
			 docker
			 editorconfig
			 eval
			 (flycheck +childframe)
			 flyspell
			 (lookup +docsets)
			 lsp
			 magit
			 macos
			 pdf

			 :lang
			 (cc +lsp)                ; C/C++/Obj-C madness
			 ;; clojure           ; java with a lisp
			 common-lisp       ; if you've seen one lisp, you've seen them all
			 data              ; config/data formats
			 ;; erlang            ; an elegant language for a more civilized age
			 ;; elixir            ; erlang done right
			 emacs-lisp        ; drown in parentheses
			 ;; go                ; the hipster dialect
			 ;; (haskell +intero)  ; a language that's lazier than I am
			 (javascript +lsp)        ; all(hope(abandon(ye(who(enter(here))))))
			  ledger            ; an accounting system in Emacs
			 (lua +moonscript)
			 markdown          ; writing docs for people to ignore
			 (org +present)         ; Emacs for presentations
			 ;; php               ; perl's insecure younger brother
			 (python +pyenv +lsp)            ; beautiful is better than ugly
			 rest              ; Emacs as a REST client
			 (rust +lsp)              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
			 (sh +fish)        ; she sells (ba|z|fi)sh shells on the C xor
			 web               ; the tubes

			 ;; Applications are complex and opinionated modules that transform Emacs
			 ;; toward a specific purpose. They may have additional dependencies and
			 ;; should be loaded late.
			 :app
			;;  irc               ; how neckbeards socialize

			 :config
			 ;; The default module sets reasonable defaults for Emacs. It also
			 ;; provides a Spacemacs-inspired keybinding scheme, a custom yasnippet
			 ;; library, and additional ex commands for evil-mode. Use it as a
			 ;; reference for your own modules.
			 (default +bindings +smartparens))
