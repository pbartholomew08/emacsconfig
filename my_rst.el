;;; my_rst.el --- 
;; 
;; Filename: my_rst.el
;; Description: Config for editing ReST files
;; Author: Paul Bartholomew
;; Maintainer: 
;; Created: Sun Oct 22 19:23:47 2017 (+0100)
;; Version: 
;; Package-Requires: ()
;; Last-Updated: Sun Oct 22 22:59:17 2017 (+0100)
;;           By: Paul Bartholomew
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

(add-hook 'rst-mode-hook
					(lambda ()
						(local-set-key (kbd "C-c C-c") 'compile)))

(add-hook 'rst-mode-hook
					(lambda ()
						(add-hook 'compilation-finish-functions
											(lambda (buf str)
												(if (null (string-match ".*exited abnormally.*" str))
														(kill-buffer-and-window))))))

(provide 'my_rst)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; my_rst.el ends here
