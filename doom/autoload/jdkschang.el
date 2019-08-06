;;; ~/dotfiles/emacs/doom/autoload/jdkschang.el -*- lexical-binding: t; -*-

;;;###autoload
(defun +jdkschang/find-in-dotfiles ()
  "Open a file somewhere in ~/dotfiles via a fuzzy filename search."
  (interactive)
  (doom-project-find-file (expand-file-name "~/org/projects/dotfiles")))

;;;###autoload
(defun +jdkschang/browse-dotfiles ()
  "Browse the files in ~/dotfiles."
  (interactive)
  (doom-project-browse (expand-file-name "~/org/projects/dotfiles")))

;; (defun +jdkschang/find-notes-for-major-mode (&optional arg)
;;   "TODO"
;;   (interactive "P")
;;   (let ((default-directory (expand-file-name "code/" +org-dir)))
;;     (if arg
;;         (call-interactively #'find-file)
;;       (find-file
;;        (expand-file-name (concat (string-remove-suffix "-mode" (symbol-name major-mode)) ".org"))))))

;;;###autoload
(defun +jdkschang/find-notes-for-project (&optional arg)
  "TODO"
  (interactive "P")
  (let ((project-root (doom-project-name 'nocache))
        (default-directory (expand-file-name "projects/" org-directory)))
    (if arg
        (call-interactively #'find-file)
      (find-file
       (expand-file-name (concat project-root ".org"))))))
