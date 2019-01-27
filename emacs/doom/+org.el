;;;  -*- lexical-binding: t; -*-

(setq-default
 org-babel-load-languages '((ledger . t)))

(after! org
	(setq
	 org-directory (expand-file-name "~/Dropbox/org/")
	 org-agenda-files '(+inbox +gtd +someday +tickler)
	 org-ellipsis " ▼ "

	 ;; The standard unicode characters are usually misaligned depending on the
	 ;; font. This bugs me. Personally, markdown #-marks for headlines are more
	 ;; elegant.
	 org-bullets-bullet-list '("#")

	 +inbox (expand-file-name "inbox.org" org-directory)
	 +gtd (expand-file-name "gtd.org" org-directory)
	 +someday (expand-file-name "someday.org" org-directory)
	 +tickler (expand-file-name "tickler.org" org-directory)
	 +daypage-path (expand-file-name "days/" org-directory)
	 org-archive-location (concat (expand-file-name "archive.org" org-directory) "::* From %s")
	 ;; org-default-notes-file (expand-file-name "notes.org" org-directory)
	 org-capture-templates '(("t" "Todo [inbox]" entry
														(file+headline +inbox "Tasks")
														"* TODO %i%?")
													 ("T" "Tickler" entry
														(file+headline +tickler "Tickler")
														"* %i%? \n %U"))
	 org-refile-targets '((+gtd :maxlevel . 3)
												(+someday :level . 1)
												(+tickler :maxlevel . 2))
	 org-todo-keywords '((sequence "TODO(t)"
																 "WAITING(w)"
																 "|"
																 "DONE(d)"
																 "CANCELLED(c)"))
	 org-agenda-custom-commands '(("o" "At the Office" tags-todo "@office"
																 ((org-agenda-overriding-header "Office")
																	(org-agenda-skip-function #'+jdkschang/org-agenda-skip-all-siblings-but-first))))
	 org-export-with-toc nil
	 ;; log time when things are marked as done
	 org-log-done 'time)

	(map!
	 :desc "Create/Edit Todo" :nve "C-c t" #'org-todo
	 :desc "Capture" :nve "C-c c" #'org-capture
	 :desc "Schedule" :nve "C-c C-s" #'org-schedule
	 :desc "Deadline" :nve "C-c C-d" #'org-deadline

	 (:leader
		 ;; main todo <SPC O>
		 :desc "Open todo file" :nvm "O" #'+open-inbox
		 ;; daypage <SPC n o/O>
		 (:prefix "n"
			 :nv "o" #'todays-daypage
			 :nv "O" #'find-daypage)
		 ;; agenda <SPC o a/A>
		 (:prefix "o"
			 :desc "Org Agenda" :nvm "a" #'org-agenda-list
			 :desc "Org Agenda and Notes" :nvm "A" #'+show-agenda))

	 (:localleader
		 :map evil-org-mode-map
		 :desc "Create/Edit Todo" :nve "o" #'org-todo
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

;; org-match-sparse-tree
;; org-set-tags-command
(defun +open-inbox ()
	(interactive)
	"Opens the todo file"
	(find-file +inbox))

(defun +show-agenda ()
	(interactive)
	(delete-other-windows)
	(with-popup-rules! nil
		(org-agenda-list)
		(calendar))
	(other-window 1)
	(split-window-vertically)
	(other-window 1)
	(todays-daypage))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Daypage stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun find-daypage (&optional date)
	"Go to the day page for the specified date, or today's if none is specified"
	(interactive (list (org-read-date)))
	(setq date (or date (format-time-string "%Y-%m-%d" (current-time))))
	(find-file
	 (expand-file-name (concat +daypage-path date ".org"))))

(defun todays-daypage ()
	"Go straight to today's day page without prompting for a date."
	(interactive)
	(find-daypage))

(set-file-template!
	"/[0-9]\\{4\\}\\(?:-[0-9]\\{2\\}\\)\\{2\\}\\.org$"
	:trigger "__daypage")
