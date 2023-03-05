;;; my_project.el --- project-mode config file
;; 
;; Filename: my_project.el
;; Description: Configuration for project mode.
;; Author: Paul Bartholomew
;; Maintainer: Paul Bartholomew
;; Created: Sun Mar 05 14:40:00 2023 (+0000)
;; Version: 0.0
;; Package-Requires: ()
;; URL:
;; Doc URL:
;; Keywords:
;; Compatibility:
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Commentary:
;;
;; The project-test command is based on the project-compile command
;; defined in `project.el', hence this file is licensed under the same
;; license.
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Change Log:
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Copyright (C) 2015-2022 Free Software Foundation, Inc.
;; Copyright (C) 2023-     Paul Bartholomew
;; 
;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;; 
;; GNU Emacs is distributed in the hope that it will be useful, but
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

(require 'project)

(defvar project-test-command nil)

(defun project-test ()
  "Run test suite from the project root."
  (declare (interactive-only compile))
  (interactive)
  (let ((default-directory (project-root (project-current t)))
	(compilation-buffer-name-function
	 (or project-compilation-buffer-name-function
	     compilation-buffer-name-function))
	(compile-command (or project-test-command
			     compile-command)))
    (call-interactively #'compile)))

(global-set-key (kbd "C-x p t") 'project-test)

(provide 'my_project)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; my_project.el ends here
