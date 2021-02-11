;;; my_LaTeX.el --- LaTeX config file
;; 
;; Filename: my_LaTeX.el
;; Description: LaTeX configuration file.
;; Author: Paul Bartholomew
;; Maintainer: Paul Bartholomew
;; Created: Sat Dec 17 19:50:11 2016 (+0000)
;; Version: 0.0
;; Package-Requires: ()
;; Last-Updated: Thu Nov 16 16:23:53 2017 (+0000)
;;           By: Paul
;;     Update #: 45
;; URL:
;; Doc URL:
;; Keywords:
;; Compatibility:
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Commentary:
;; 
;;  Requires AUCTeX
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Change Log:
;; 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;; 
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;; 
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:

;; Enable document parsing
;; N.B. The order appears to be important to properly call BibTeX if
;; necessary.
(setq-default TeX-auto-save t)
(setq-default TeX-parse-self t)

;; Set pdflatex as default backend
(setq-default TeX-PDF-mode t)

;; Make AUCTeX aware of multi-file documents
(setq-default TeX-master nil)

;; Enable spell-check
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-buffer)

;; Enable auto-fill
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)

;; Set keys
(defun my-LaTeX-keys ()
  "Set ctrl-c p to run preview-section."
  (evil-define-key 'normal 'LaTeX-mode-map (kbd "C-c p") 'preview-section))
(add-hook 'LaTeX-mode-hook 'my-LaTeX-keys)

;; Enable auto-completion
(require 'company-auctex)
(company-auctex-init)
(require 'company-bibtex)
(add-to-list 'company-backends
	     'company-bibtex)
(with-eval-after-load "~/.custom.el"
  (setq company-bibtex-bibliography biblist))

;; Enable rainbow-delimiters
(add-hook 'LaTeX-mode-hook 'rainbow-delimiters-mode)

;; Use okular with synctex
(server-mode) ; Enables two-way code-pdf search
(setq LaTeX-command "latex -synctex=1")
(setq-default TeX-view-program-list
	      '(("okular" "okular --unique %o#src:%n%b")))
(setq TeX-view-program-selection
      '((output-pdf "okular")))

;; Add nomencl build
(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
		'("Nomenclature" "makeindex %s.nlo -s nomencl.ist -o %s.nls"
		  TeX-run-command nil t :help "Create nomenclature file")))

;; RefTeX integration
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq-default reftex-plug-into-AUCTeX t)
(with-eval-after-load "~/.custom.el"
  (setq-default reftex-default-bibliography biblist))

;; RefTeX speedups
(setq-default reftex-enable-partial-scans t)
(setq-default reftex-save-parse-info t)
(setq-default reftex-use-multiple-selection-buffers t)
(setq-default reftex-trust-label-prefix '("eq"))

;; Enable reftex in org-mode
(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all))
  (define-key org-mode-map (kbd "C-c (") 'reftex-citation))
(add-hook 'org-mode-hook 'org-mode-reftex-setup)

;; ;; Writegood-mode, highlights poor English
;; (require 'writegood-mode)
;; (add-hook 'LaTeX-mode-hook
;; 	  (lambda ()
;; 	    (local-set-key (kbd "C-c g") 'writegood-mode)))

(provide 'my_LaTeX)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; my_LaTeX.el ends here
