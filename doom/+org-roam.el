;;; ~/projects/jdkschang/dotfiles/doom/+org-roam.el -*- lexical-binding: t; -*-
(use-package! org-roam-server)
(after! org-roam
  (setq org-roam-graph-viewer "/usr/bin/open"
        org-roam-encrypt-files t)

  (setq org-roam-ref-capture-templates
        '(("r" "ref" plain (function org-roam-capture--get-point)
           "%?"
           :file-name "websites/${slug}"
           :head "#+TITLE: ${title}
#+roam_key: ${ref}
- source :: ${ref}"
           :unnarrowed t)))
  (setq org-roam-capture-templates
        '(("d" "default" plain (function org-roam--capture-get-point)
           "%?"
           :file-name "${slug}"
           :head "#+TITLE: ${title}\n"
           :unnarrowed t)))
  (map! :leader
        :prefix "n"
        :desc "org-roam" "l" #'org-roam
        :desc "org-roam-insert" "i" #'org-roam-insert
        :desc "org-roam-switch-to-buffer" "b" #'org-roam-switch-to-buffer
        :desc "org-roam-find-file" "f" #'org-roam-find-file
        :desc "org-roam-show-graph" "g" #'org-roam-show-graph
        :desc "org-journal-new-entry" "j" #'org-journal-new-entry
        :desc "org-roam-capture" "c" #'org-roam-capture)

  (setq org-roam-graph-node-extra-config '(("shape"      . "underline")
                                           ("style"      . "rounded,filled")
                                           ("fillcolor"  . "#EEEEEE")
                                           ("color"      . "#C9C9C9")
                                           ("fontcolor"  . "#111111")
                                           ("fontname"   . "MonoLisa"))))

;;   (setq +org-roam-graph--html-template
;;         (replace-regexp-in-string "%\\([^s]\\)" "%%\\1"
;;                                   (f-read-text (concat doom-private-dir "misc/org-roam-template.html"))))

;;   (defadvice! +org-roam-graph--build-html (&optional node-query callback)
;;     "Generate a graph showing the relations between nodes in NODE-QUERY. HTML style."
;;     :override #'org-roam-graph--build
;;     (unless (stringp org-roam-graph-executable)
;;       (user-error "`org-roam-graph-executable' is not a string"))
;;     (unless (executable-find org-roam-graph-executable)
;;       (user-error (concat "Cannot find executable %s to generate the graph.  "
;;                           "Please adjust `org-roam-graph-executable'")
;;                   org-roam-graph-executable))
;;     (let* ((node-query (or node-query
;;                            `[:select [file titles] :from titles
;;                              ,@(org-roam-graph--expand-matcher 'file t)]))
;;            (graph      (org-roam-graph--dot node-query))
;;            (temp-dot   (make-temp-file "graph." nil ".dot" graph))
;;            (temp-graph (make-temp-file "graph." nil ".svg"))
;;            (temp-html  (make-temp-file "graph." nil ".html")))
;;       (org-roam-message "building graph")
;;       (make-process
;;        :name "*org-roam-graph--build-process*"
;;        :buffer "*org-roam-graph--build-process*"
;;        :command `(,org-roam-graph-executable ,temp-dot "-Tsvg" "-o" ,temp-graph)
;;        :sentinel (progn
;;                    (lambda (process _event)
;;                      (when (= 0 (process-exit-status process))
;;                        (write-region (format +org-roam-graph--html-template (f-read-text temp-graph)) nil temp-html)
;;                        (when callback
;;                          (funcall callback temp-html)))))))))


(defadvice! doom-modeline--reformat-roam (orig-fun)
  :around #'doom-modeline-buffer-file-name
  (message "Reformat?")
  (message (buffer-file-name))
  (if (s-contains-p org-roam-directory (or buffer-file-name ""))
      (replace-regexp-in-string
       "\\(?:^\\|.*/\\)\\([0-9]\\{4\\}\\)\\([0-9]\\{2\\}\\)\\([0-9]\\{2\\}\\)[0-9]*-"
       "🢔(\\1-\\2-\\3) "
       (funcall orig-fun))
    (funcall orig-fun)))

(use-package deft
  :after org
  :bind
  ("C-c n d" . deft)
  :custom
  (deft-recursive t)
  (deft-use-filter-string-for-filename t)
  (deft-default-extension "org")
  (deft-auto-save-interval -1.0)
  (deft-directory "~/Dropbox/3 Resources/org-roam/"))

(use-package org-journal
  :bind
  ("C-c n j" . org-journal-new-entry)
  :custom
  (org-journal-dir "~/Dropbox/3 Resources/org-roam/")
  (org-journal-date-prefix "#+TITLE: ")
  (org-journal-file-format "%Y-%m-%d.org")
  (org-journal-date-format "%A, %d %B %Y"))
(setq org-journal-enable-agenda-integration t)

(require 'simple-httpd)
(setq httpd-root "/var/www")
(httpd-start)

(setq org-roam-directory "~/Dropbox/3 Resources/org-roam/")
;; (use-package org-roam-server
;;   :ensure t
;;   :config
;;   (setq org-roam-server-host "127.0.0.1"
;;         org-roam-server-port 8080
;;         org-roam-server-export-inline-images t
;;         org-roam-server-authenticate nil
;;         org-roam-server-network-poll t
;;         org-roam-server-network-arrows nil
;;         org-roam-server-network-label-truncate t
;;         org-roam-server-network-label-truncate-length 60
;;         org-roam-server-network-label-wrap-length 20))

(add-hook 'org-roam-server-mode (lambda () (browse-url-chrome "http://localhost:8078"))
  :after org-roam
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8078
        org-roam-server-export-inline-images t
        org-roam-server-authenticate nil
        org-roam-server-label-truncate t
        org-roam-server-label-truncate-length 60
        org-roam-server-label-wrap-length 20)
  (defun org-roam-server-open ()
    "Ensure the server is active, then open the roam graph."
    (interactive)
    (org-roam-server-mode 1)
    (browse-url-xdg-open (format "http://localhost:%d" org-roam-server-port))))

;; Refile a heading to another buffer
;; Allows you to refile into different files - specifically to
;; create new 'parent' headings
(setq org-refile-use-outline-path 'file)
;; makes org-refile outline working with helm/ivy
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-allow-creating-parent-nodes 'confirm)
(defun +org/opened-buffer-files ()
  "Return the list of files currently opened in emacs"
  (delq nil
        (mapcar (lambda (x)
                  (if (and (buffer-file-name x)
                           (string-match "\\.org$"
                                         (buffer-file-name x)))
                      (buffer-file-name x)))
                (buffer-list))))

(setq org-refile-targets '((+org/opened-buffer-files :maxlevel . 9)))
