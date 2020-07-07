;;;  -*- lexical-binding: t; -*-

(after! org
  (setq org_notes "~/Dropbox/3 Resources/org-roam"
        org-directory org_notes                     ; let's put files here
        deft-directory org_notes                     ; let's put files here
        org-roam-directory org_notes                     ; let's put files here
        org-default-notes-file (concat org_notes "/inbox.org")
        org-use-property-inheritance t              ; it's convenient to have properties inherited
        org-log-done 'time                          ; having the time recorded sounds convenient
        org-list-allow-alphabetical t               ; have a. A. a) A) list bullets
        org-export-in-background t                  ; run export processes in external emacs process
        org-catch-invisible-edits 'smart            ; try not to accidently do weird stuff in invisible regions

        org-agenda-files (list org-directory)
        org-ellipsis " ⤵ "
        org-priority-highest ?A
        org-priority-lowest ?E
        org-priority-faces
        '((?A . 'all-the-icons-red)
          (?B . 'all-the-icons-orange)
          (?C . 'all-the-icons-yellow)
          (?D . 'all-the-icons-green)
          (?E . 'all-the-icons-blue))

        ;; The standard unicode characters are usually misaligned depending on the
        ;; font. This bugs me. Personally, markdown #-marks for headlines are more
        ;; elegant.
        org-bullets-bullet-list '("#")

        org-todo-keywords '((sequence "TODO(t)"
                                      "STARTED(s)"
                                      "WAITING(w)"
                                      "|"
                                      "DONE(d)"
                                      "CANCELLED(c)"))

        org-babel-default-header-args '((:session . "none")
                                        (:results . "replace")
                                        (:exports . "code")
                                        (:cache . "no")
                                        (:noweb . "no")
                                        (:hlines . "no")
                                        (:tangle . "no")
                                        (:comments . "link"))

        org-list-demote-modify-bullet '(("+" . "-") ("-" . "+") ("*" . "+"))
        org-todo-state-tags-triggers
        (quote (("CANCELLED" ("CANCELLED" . t))
                ("WAITING" ("WAITING" . t))
                ("HOLD" ("WAITING") ("HOLD" . t))
                (done ("WAITING") ("HOLD"))
                ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
                ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
                ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

  (map! :map evil-org-mode-map
      :after evil-org
      :n "g <up>" #'org-backward-heading-same-level
      :n "g <down>" #'org-forward-heading-same-level
      :n "g <left>" #'org-up-element
      :n "g <right>" #'org-down-element)
  (map! :map org-mode-map
        :n "M-j" #'org-metadown
        :n "M-k" #'org-metaup)

  (custom-set-faces!
      '(org-document-title :height 1.2))

  (appendq! +pretty-code-symbols
            '(:checkbox   "☐"
              :pending    "◼"
              :checkedbox "☑"
              :list_property "∷"
              :results       "🠶"
              :property      "☸"
              :properties    "⚙"
              :end           "∎"
              :options       "⌥"
              :title         "𝙏"
              :subtitle      "𝙩"
              :author "𝘼"
              :date "𝘿"
              :begin_quote "❮"
              :end_quote "❯"
              :begin_export  "⯮"
              :end_export    "⯬"
              :priority_a   ,(propertize "⚑" 'face 'all-the-icons-red)
              :priority_b   ,(propertize "⬆" 'face 'all-the-icons-orange)
              :priority_c   ,(propertize "■" 'face 'all-the-icons-yellow)
              :priority_d   ,(propertize "⬇" 'face 'all-the-icons-green)
              :priority_e   ,(propertize "❓" 'face 'all-the-icons-blue)
              :em_dash "—"))
  (set-pretty-symbols! 'org-mode
    :merge t
    :checkbox      "[ ]"
    :pending       "[-]"
    :checkedbox    "[X]"
    :list_property "::"
    :results       "#+RESULTS:"
    :property      "#+PROPERTY:"
    :property      ":PROPERTIES:"
    :end           ":END:"
    :options       "#+OPTIONS:"
    :title         "#+TITLE:"
    :subtitle      "#+SUBTITLE:"
    :author        "#+AUTHOR:"
    :date          "#+DATE:"
    :begin_quote   "#+BEGIN_QUOTE"
    :end_quote     "#+END_QUOTE"
    :begin_export  "#+BEGIN_EXPORT"
    :end_export    "#+END_EXPORT"
    :priority_a    "[#A]"
    :priority_b    "[#B]"
    :priority_c    "[#C]"
    :priority_d    "[#D]"
    :priority_e    "[#E]"
    :em_dash "---"))
(plist-put +pretty-code-symbols :name "⁍")



(map!
   :desc "Create/Edit Todo" :nve "C-c t" #'org-todo
   :desc "Store Link" :nve "C-c l" #'org-store-link
   :desc "Insert Link" :nve "C-c C-l" #'org-insert-link
   :desc "Capture" :nve "C-c c" #'org-capture
   :desc "Schedule" :nve "C-c C-s" #'org-schedule
   :desc "Deadline" :nve "C-c C-d" #'org-deadline

   :desc "org-shiftdown" :nve "J" #'org-shiftdown
   :desc "org-shiftup" :nve "K" #'org-shiftup
   :desc "org-shiftleft" :nve "H" #'org-shiftleft
   :desc "org-shiftright" :nve "L" #'org-shiftright

   (:localleader
     :map evil-org-mode-map
     :desc "Create/Edit Todo" :nve "C-t" #'org-todo
     :desc "Store Link" :nve "l" #'org-store-link
     :desc "Insert Link" :nve "C-l" #'org-insert-link
     :desc "Schedule" :nve "s" #'org-schedule
     :desc "Deadline" :nve "d" #'org-deadline
     :desc "Refile" :nve "r" #'org-refile
     :desc "Filter" :nve "f" #'org-match-sparse-tree
     :desc "Tag heading" :nve "t" #'org-set-tags-command))


(load! "+org-roam")
