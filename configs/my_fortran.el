;;; my_fortran.el --- FORTRAN config.
;; 
;; Filename: my_fortran.el
;; Description: Configuration for FORTRAN
;; Author: Paul Bartholomew
;; Maintainer: Paul Bartholomew
;; Created: Mon Sep 18 23:27:52 2017 (+0100)
;; Version: 0.0
;; Package-Requires: ()
;; Last-Updated: Fri Sep 29 16:44:11 2017 (+0100)
;;           By: Paul
;;     Update #: 5
;; URL:
;; Doc URL:
;; Keywords:
;; Compatibility:
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Commentary:
;; 
;; 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Change Log:
;;
;; [18-SEP-2017] About to start postdoc, going to need some FORTRAN editting!
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

;; General
(defun my_fortran_keybindings ()
	"Bind keys for fortran mode(s)."
	(local-set-key (kbd "C-c C-c") 'compile))

;; FORTRAN (F77)
(add-hook 'fortran-mode-hook 'auto-make-header)

;; fortran (F90)
(add-hook 'f90-mode-hook 'auto-make-header)
(add-hook 'f90-mode-hook 'my_fortran_keybindings)
(add-hook 'f90-mode-hook
					(lambda ()
						(setq f90-do-indent 2 ; Default is 3
									f90-if-indent 2 ; Default is 3
									)
						(if f90-auto-keyword-case
								(f90-change-keywords f90-auto-keyword-case))))
(setq-default flycheck-fortran-gfortran-executable "mpif90") ; Prevents "Cannot find MPI errors"

(provide 'my_fortran)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; my_fortran.el ends here
