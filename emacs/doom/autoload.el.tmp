;;; ~/dotfiles/emacs/doom/autoload.el -*- lexical-binding: t; -*-

;; === LSP Modes ===
;;;###autoload
(defun +cquery|c-modes ()
   "We'll only enable cquery in specfic c-modes."
   (when (memq major-mode '(c-mode c++-mode objc-mode))
     (condition-case nil
         (lambda () (require 'cquery) (lsp))
       (user-error nil))))

;;;###autoload
(defun +ccls|c-modes ()
   "We'll only enable ccls in specfic c-modes."
   (when (memq major-mode '(c-mode c++-mode objc-mode))
     (condition-case nil
         (lambda () (require 'ccls) (lsp))
       (user-error nil))))

(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection "fortls")
                  :major-modes '(f90-mode fortran-mode)
                  :server-id 'fortls))

;;;###autoload
(defun +lsp-javacomp|java-mode ()
  ;; Only enable in strictly java-mode, not ANY. OTHER. MODE.
  (when (eq major-mode 'java-mode)
    (condition-case nil
        (lsp-javacomp-enable)
      (user-error nil))))

;;;###autoload
(defun +web|init-lsp-html ()
  (when (and (executable-find "html-languageserver") (eq major-mode 'html-mode))
    (condition-case nil
        (add-hook 'html-mode-hook 'lsp)
      (user-error nil))))

;;;###autoload
(defun +lsp-js|js-ts-mode ()
  ;; Only enable when we've found the executable `language-server' and ONLY in
  ;; a js2-mode buffer.
  (when (and (executable-find "javascript-typescript-stdio")
             (memq major-mode '(typescript-mode js-mode js2-mode rjsx-mode)))
    (condition-case nil
        (add-hook!
          '(typescript-mode js-mode js2-mode rjsx-mode) 'lsp)
      (user-error nil))))
;; END of LSP stuff
