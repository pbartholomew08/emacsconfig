;;; my_LaTeX.el --- LaTeX config file
;; 
;; Filename: my_LaTeX.el
;; Description: LaTeX configuration file.
;; Author: Paul Bartholomew
;; Maintainer: Paul Bartholomew
;; Created: Sat Dec 17 19:50:11 2016 (+0000)
;; Version: 0.0
;; Package-Requires: ()
;; Last-Updated: Sun Dec 18 16:24:26 2016 (+0000)
;;           By: Paul Bartholomew
;;     Update #: 25
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
;(add-hook 'LaTeX-mode-hook 'auto-fill-mode)

;; Set keys
(defun my-LaTeX-keys ()
  "Set ctrl-c p to run preview-section."
  (evil-define-key 'normal LaTeX-mode-map (kbd "C-c p") 'preview-section))
(add-hook 'LaTeX-mode-hook 'my-LaTeX-keys)

;; Enable auto-completion
(require 'company-auctex)
(company-auctex-init)

;; Enable rainbow-delimiters
(add-hook 'LaTeX-mode-hook 'rainbow-delimiters-mode)

;; Use okular with synctex
(setq LaTeX-command "latex -synctex=1")
(setq-default TeX-view-program-list
      '(("okular" "okular --unique %o#src:%n%b")))
(setq TeX-view-program-selection
      '((output-pdf "okular")))

;; RefTeX integration
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq-default reftex-plug-into-AUCTeX t)

(provide 'my_LaTeX)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; my_LaTeX.el ends here
