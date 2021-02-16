;;;; my_paredit --- Setup for paredit mode
;;
;;; Commentary:
;;
;;; Code:

(require 'paredit)

(autoload 'enable-paredit-mode
  "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)

;;; Keybindings

;; The slurp and bar commands feel back to front
(add-hook 'paredit-mode-hook
	 (lambda ()
	   (local-set-key (kbd "C-<left>") 'paredit-backward-slurp-sexp)
	   (local-set-key (kbd "C-<right>") 'paredit-backward-barf-sexp)
	   (local-set-key (kbd "C-M-<left>") 'paredit-forward-barf-sexp)
	   (local-set-key (kbd "C-M-<right>") 'paredit-forward-slurp-sexp)))

;; Fix keybindings overridden by evil
(require 'evil)
(add-hook 'paredit-mode-hook
	  (lambda ()
	    (evil-local-set-key 'insert (kbd "C-k") 'paredit-kill)))

;;; Enable paredit in lisp modes
(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook #'enable-paredit-mode)
(add-hook 'geiser-repl-mode-hook #'enable-paredit-mode)

(provide 'my_paredit)
;;; my_paredit.el ends here
