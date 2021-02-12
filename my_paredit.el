;;;; my_paredit --- Setup for paredit mode
;;
;;; Commentary:
;;
;;; Code:

(autoload 'enable-paredit-mode
  "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)

(add-hook 'paredit-mode-hook
	  (lambda ()
	    (evil-local-set-key 'insert (kbd "C-k") 'paredit-kill)))

(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook #'enable-paredit-mode)
(add-hook 'geiser-repl-mode-hook #'enable-paredit-mode)

(provide 'my_paredit)
;;; my_paredit.el ends here
