;;; init.el -*- lexical-binding: t; -*-
;; Copy me to ~/.doom.d/init.el or ~/.config/doom/init.el, then edit me!

(doom! :feature
                                        ;debugger          ; FIXME stepping through code, to help you add bugs
       eval              ; run code, run (also, repls)
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       (lookup           ; helps you navigate your code and documentation
        +devdocs)
       snippets          ; my elves. They type so I don't have to
       spellcheck        ; tasing you for misspelling mispelling
       syntax-checker   ; tasing you for every semicolon you forget
       workspaces        ; tab emulation, persistence & separate workspaces

       :completion
       (company          ; the ultimate code completion backend
        +auto)           ; as-you-type code completion
       (helm             ; the *other* search engine for love and life
        +fuzzy)          ; enable fuzzy search backend for helm

       :ui
       doom
       doom-dashboard
       modeline
       doom-quit
       evil-goggles
       hl-todo           ; highlight TODO/FIXME/NOTE tags
       nav-flash         ; blink the current line after jumping
       treemacs          ; a project drawer, like neotree but cooler
       (popup            ; tame sudden yet inevitable temporary windows
        +all             ; catch all popups that start with an asterix
        +defaults)       ; default popup rules
       (pretty-code +fira)

       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       window-select     ; visually switch windows

       :editor
       multiple-cursors  ; editing in many places at once
       parinfer          ; turn lisp into python, sort of
       rotate-text       ; cycle region at point between text candidates

       :emacs
       dired             ; making dired pretty [functional]
       ediff             ; comparing files in Emacs
       electric          ; smarter, keyword-based electric-indent
       hideshow          ; basic code-folding support
       imenu             ; an imenu sidebar and searchable code index
       term              ; terminals in Emacs
       vc                ; version-control and Emacs, sitting in a tree

       :tools
       editorconfig
       gist              ; interacting with github gists
       macos             ; MacOS-specific commands
       make              ; run make tasks from Emacs
       magit             ; a git porcelain for Emacs
       password-store    ; password manager for nerds
       pdf               ; pdf enhancements
       prodigy           ; FIXME managing external services & code builders
       tmux              ; an API for interacting with tmux
       upload            ; map local to remote projects via ssh/ftp

       :lang
       cc                ; C/C++/Obj-C madness
       clojure           ; java with a lisp
       common-lisp       ; if you've seen one lisp, you've seen them all
       data              ; config/data formats
       ;; erlang            ; an elegant language for a more civilized age
       ;; elixir            ; erlang done right
       emacs-lisp        ; drown in parentheses
       ;; go                ; the hipster dialect
       (haskell +dante)  ; a language that's lazier than I am
       javascript        ; all(hope(abandon(ye(who(enter(here))))))
       ledger            ; an accounting system in Emacs
       markdown          ; writing docs for people to ignore
       ocaml             ; an objective camel
       (org              ; organize your plain life in plain text
        +attach          ; custom attachment system
        +babel           ; running code in org
        +capture         ; org-capture in and outside of Emacs
        +export          ; Exporting org to whatever you want
        +present)        ; Emacs for presentations
       ;; php               ; perl's insecure younger brother
       python            ; beautiful is better than ugly
       rest              ; Emacs as a REST client
       rust              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       (sh +zsh)        ; she sells (ba|z|fi)sh shells on the C xor
       swift             ; who asked for emoji variables?
       web               ; the tubes

       ;; Applications are complex and opinionated modules that transform Emacs
       ;; toward a specific purpose. They may have additional dependencies and
       ;; should be loaded late.
       :app
                                        ;(email +gmail)    ; emacs as an email client
       irc               ; how neckbeards socialize
                                        ;(rss +org)        ; emacs as an RSS reader
                                        ;twitter           ; twitter client https://twitter.com/vnought
       (write            ; emacs as a word processor (latex + org + markdown)
        +wordnut         ; wordnet (wn) search
        +langtool)       ; a proofreader (grammar/style check) for Emacs

       :completion
       (lsp
        ;; +javascript
        +go
        +css
        +rust
        +cpp
        +ocaml
        +java
        +python
        +sh)

       :config
       ;; The default module sets reasonable defaults for Emacs. It also
       ;; provides a Spacemacs-inspired keybinding scheme, a custom yasnippet
       ;; library, and additional ex commands for evil-mode. Use it as a
       ;; reference for your own modules.
       (default +bindings +snippets +evil-commands))

