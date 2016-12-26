;;; my_cc.el --- C/C++ config file.
;; 
;; Filename: my_cc.el
;; Description: Configuration for C and C++.
;; Author: Paul Bartholomew
;; Maintainer: Paul Bartholomew
;; Created: Thu Dec 22 22:20:11 2016 (+0000)
;; Version: 0.0
;; Package-Requires: ()
;; Last-Updated: Thu Dec 22 23:22:34 2016 (+0000)
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

;; General
(load "/usr/share/clang/clang-format.el")
;; C
(add-hook 'c-mode-hook 'auto-make-header) ; Set create headers in new .c files automatically
(setq-default c-default-style "bsd"
							c-basic-offset 2)

;; C++
(add-hook 'c++-mode-hook 'auto-make-header)

(provide 'my_cc)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; my_cc.el ends here
