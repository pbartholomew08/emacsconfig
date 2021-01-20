;;; my_clisp.el --- clisp config.
;; 
;; Filename: my_clisp.el
;; Description: Configuration file for common lisp.
;; Author: Paul Bartholomew
;; Maintainer: Paul Bartholomew
;; Created: Thu Dec 22 22:07:58 2016 (+0000)
;; Version: 0.0
;; Package-Requires: ()
;; Last-Updated: Tue Oct 17 22:12:17 2017 (+0100)
;;           By: Paul Bartholomew
;;     Update #: 20
;; URL:
;; Doc URL:
;; Keywords:
;; Compatibility:
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Commentary:
;; 
;;  Configuration for common Lisp uses SLIME.
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

(add-hook 'lisp-mode-hook 'prettify-symbols-mode)

;; SLIME config
(setq-default slime-lisp-implementations
	      '(
		(sbcl ("sbcl" "--core" "/home/paul/src/clisp/sbcl/sbcl.core-for-slime"))
                (ccl ("ccl64"))
		(clisp ("clisp"))
		))
(setq-default slime-contribs '(slime-repl))
(add-hook 'slime-repl-mode-hook
	  (lambda ()
	    (evil-local-mode -1)))


;; ;; Automatically load SLIME
;; (add-hook 'slime-mode-hook
;; 					(lambda ()
;; 						(unless (slime-connected-p)
;; 							(save-excursion (slime)))))

(provide 'my_clisp)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; my_clisp.el ends here
