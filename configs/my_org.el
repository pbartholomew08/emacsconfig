;;; my_org.el --- org-mode config.
;; 
;; Filename: my_org.el
;; Description: Configures org-mode
;; Author: Paul Bartholomew
;; Maintainer: Paul Bartholomew
;; Created: Wed Dec 14 22:16:58 2016 (+0000)
;; Version: 
;; Package-Requires: ()
;; Last-Updated: Wed Dec 14 22:19:20 2016 (+0000)
;;           By: Paul Bartholomew
;;     Update #: 2
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
;; [14-Dec-2016] Implementing old config.
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

(setq org-agenda-files '("~/org"))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-enforce-todo-dependencies t)  ; Enforces that a parent can only be DONE when 
                                        ; all children are DONE
(setq org-log-done 'time)               ; Track time when tasks complete
(setq org-fast-tag-selection-include-todo t) ; Enable fast access of TODO states
(add-hook 'org-mode-hook
          (lambda () (linum-mode -1))) ; disable linum mode within org-mode as it does not work

(provide 'my_org)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; my_org.el ends here
