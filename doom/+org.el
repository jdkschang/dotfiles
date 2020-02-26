;;;  -*- lexical-binding: t; -*-

(after! org
  (add-to-list 'org-modules 'org-habit t)

  (setq org-directory (expand-file-name "~/Dropbox/org/")
   org-agenda-files (list org-directory)
   org-ellipsis " ⤵ "

   ;; The standard unicode characters are usually misaligned depending on the
   ;; font. This bugs me. Personally, markdown #-marks for headlines are more
   ;; elegant.
   org-bullets-bullet-list '("#")

   +inbox (expand-file-name "inbox.org" org-directory)
   +gtd (expand-file-name "gtd.org" org-directory)
   +someday (expand-file-name "someday.org" org-directory)
   +tickler (expand-file-name "tickler.org" org-directory)
   +ref (expand-file-name "reference.org" org-directory)
   +daypage-path (expand-file-name "days/" org-directory)

   org-archive-location (concat (expand-file-name "archive.org" org-directory) "::* From %s")
   org-capture-templates '(("t" "Todo [inbox]" entry
                            (file+headline +inbox "Tasks")
                            "* TODO %i%?")
                           ("T" "Tickler" entry
                            (file+headline +tickler "Tickler")
                            "* %i%? \n %U"))
   org-refile-targets '((+gtd :maxlevel . 3)
                        (+someday :level . 1)
                        (+tickler :maxlevel . 2)
                        (+ref :maxlevel . 3))
   org-todo-keywords '((sequence "TODO(t)"
                                 "STARTED(s)"
                                 "WAITING(w)"
                                 "|"
                                 "DONE(d)"
                                 "CANCELLED(c)"))
   org-agenda-custom-commands '(("o" "At the Office" tags-todo "@work"
                                 ((org-agenda-overriding-header "Geesee:")
                                  (org-agenda-skip-function #'+jdkschang/org-agenda-skip-all-siblings-but-first))))
   ;; org-export-with-toc nil
   ;; log time when things are marked as done
   org-log-done 'time)

  (appendq! +pretty-code-symbols
            '(:checkbox   "☐"
              :pending    "◼"
              :checkedbox "☑"
              :results "🠶"
              :property "☸"
              :option "⌥"
              :title "𝙏"
              :author "𝘼"
              :date "𝘿"
              :begin_quote "❮"
              :end_quote "❯"
              :em_dash "—"))
  (set-pretty-symbols! 'org-mode
    :merge t
    :checkbox   "[ ]"
    :pending    "[-]"
    :checkedbox "[X]"
    :results "#+RESULTS:"
    :property "#+PROPERTY:"
    :option "#+OPTION:"
    :title "#+TITLE:"
    :author "#+AUTHOR:"
    :date "#+DATE:"
    :begin_quote "#+BEGIN_QUOTE"
    :end_quote "#+END_QUOTE"
    :em_dash "---")

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

   (:leader
     ;; main todo <SPC O>
     :desc "Open Inbox" :nvm "I" #'+open-inbox)

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

  ;; Normally its only like 3 lines tall, too hard to see anything.
  (set-popup-rule! "^\\*Org Agenda"
    :size 15
    :quit t
    :select t
    :parameters
    '((transient))))


(defun +jdkschang/org-agenda-skip-all-siblings-but-first ()
  "Skip all but the first non-done entry."
  (let (should-skip-entry)
    (unless (+jdkschang/org-current-is-todo)
      (setq should-skip-entry t))
    (save-excursion
      (while (and (not should-skip-entry) (org-goto-sibling t))
        (when (+jdkschang/org-current-is-todo)
          (setq should-skip-entry t))))
    (when should-skip-entry
      (or (outline-next-heading)
          (goto-char (point-max))))))

(defun +jdkschang/org-current-is-todo ()
  (string= "TODO" (org-get-todo-state)))

(defun +open-inbox ()
  (interactive)
  "Opens the Inbox"
  (find-file +inbox))


(plist-put +pretty-code-symbols :name "⁍")
