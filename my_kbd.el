;;; my_kbd.el --- keyboard bindings.
;; 
;; Filename: my_kbd.el
;; Description: Config file for keyboards bindings.
;; Author: Paul Bartholomew
;; Maintainer:
;; Created: Fri Dec 16 23:40:37 2016 (+0000)
;; Version:
;; Package-Requires: ()
;; Last-Updated: Sat Jan  7 17:49:20 2017 (+0000)
;;           By: Paul Bartholomew
;;     Update #: 16
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

(defun buildScript ()
  "Run the buildscript .buildScript.sh."
  (interactive)
	(shell-command "./.buildScript.sh"))
(global-set-key (kbd "C-c b") 'buildScript)

;; Buffer cycling
(global-set-key (kbd "C-S-<prior>") 'previous-buffer)
(global-set-key (kbd "C-S-<next>") 'next-buffer)

;; Close buffer
(global-set-key (kbd "C-S-w") 'delete-window)

;; Indent buffer
(defun my_indent-buffer ()
	"Use `indent-region between' `point-min' and `point-max' to indent/format whole buffer."
	(interactive)
	(save-excursion
		(indent-region (point-min) (point-max) nil)))
(global-set-key (kbd "C-S-f") 'my_indent-buffer)

;; Enable whitespace-mode
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; Rebind M-3 to hash symbol (for Mac's stupid keyboard layout)
(global-set-key (kbd "M-3")
		'(lambda ()
		   (interactive)
		   (insert "#")))

(provide 'my_kbd)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; my_kbd.el ends here
