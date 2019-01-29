;;;  -*- lexical-binding: t; -*-

(setq-default
 org-babel-load-languages '((ledger . t)))

(after! org
	(setq
	 org-directory (expand-file-name "~/Dropbox/org/")
	 org-agenda-files (list org-directory)
	 org-ellipsis " ▼ "

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
												(+ref :maxlevel . 1))
	 org-todo-keywords '((sequence "TODO(t)"
																 "WAITING(w)"
																 "|"
																 "DONE(d)"
																 "CANCELLED(c)"))
	 org-agenda-custom-commands '(("o" "At the Office" tags-todo "@work"
																 ((org-agenda-overriding-header "Geesee:")
																	(org-agenda-skip-function #'+jdkschang/org-agenda-skip-all-siblings-but-first))))
	 org-export-with-toc nil
	 ;; log time when things are marked as done
	 org-log-done 'time)

	(map!
	 ; :desc "Enter new header" :map evil-org-mode-map :nvie "s-return" #'evil-org-org-insert-heading-respect-content-below
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
		 :desc "Open Inbox" :nvm "I" #'+open-inbox
		 :desc "Open GTD" :nvm "G" #'+open-gtd
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

;; org-match-sparse-tree
;; org-set-tags-command
(defun +open-inbox ()
	(interactive)
	"Opens the Inbox"
	(find-file +inbox))

(defun +open-gtd ()
	(interactive)
	"Opens the GTD file"
	(find-file +gtd))

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
