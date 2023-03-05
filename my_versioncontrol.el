;;; my_versioncontrol.el --- version control config,
;; 
;; Filename: my_versioncontrol.el
;; Description: Config feil for version control packages.
;; Author: Paul Bartholomew
;; Maintainer: Paul Bartholomew
;; Created: Sat Dec 17 00:00:21 2016 (+0000)
;; Version: 0.0
;; Package-Requires: ()
;; Last-Updated: Sun Dec 18 19:49:11 2016 (+0000)
;;           By: Paul Bartholomew
;;     Update #: 13
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

;; diff-hl highlights differences relative to version-control.
(require 'diff-hl)
(setq-default diff-hl-side 'right)
(global-diff-hl-mode)
(add-hook 'prog-mode-hook 'diff-hl-flydiff-mode)
(add-hook 'LaTeX-mode-hook 'diff-hl-flydiff-mode)

(require 'magit)
(add-hook 'magit-post-refressh-hook 'diff-hl-magit-post-refresh)

(require 'vc-git) ; Seems to be required by project.el

(provide 'my_versioncontrol)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; my_versioncontrol.el ends here
