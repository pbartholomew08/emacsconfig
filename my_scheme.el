;;; my_scheme.el --- scheme settings
;; 
;; Filename: my_scheme.el
;; Description:
;; Author: Paul Bartholomew
;; Maintainer:
;; Created: Sun Aug  5 19:49:45 2018 (+0100)
;; Version:
;; Package-Requires: ()
;; Last-Updated: Sat Aug 11 15:44:01 2018 (+0100)
;;           By: Paul Bartholomew
;;     Update #: 4
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

(add-hook 'scheme-mode-hook 'geiser-mode)
(add-hook 'scheme-mode-hook 'prettify-symbols-mode)
(setq-default geiser-default-implementation 'guile)
(setq-default geiser-guile-binary
	      (cond ((string-equal system-type "darwin")
		     "/usr/local/bin/guile")
		    ((string-equal system-type "gnu/linux")
		     "/bin/guile")))

(provide 'my_scheme)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; my_scheme.el ends here
