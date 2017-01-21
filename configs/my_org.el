;;; my_org.el --- org-mode config.
;; 
;; Filename: my_org.el
;; Description: Configures org-mode
;; Author: Paul Bartholomew
;; Maintainer: Paul Bartholomew
;; Created: Wed Dec 14 22:16:58 2016 (+0000)
;; Version: 0.0
;; Package-Requires: ()
;; Last-Updated: Tue Jan 10 23:16:46 2017 (+0000)
;;           By: Paul Bartholomew
;;     Update #: 45
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

;; Basic customisation
(setq-default org-directory "~/org/")
(setq-default org-agenda-files '("~/org/"))
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(setq-default org-enforce-todo-dependencies t)       ; Enforces that a parent can only be DONE
                                                     ; when all children are DONE
(setq-default org-log-done 'time)                    ; Track time when tasks complete
(setq-default org-fast-tag-selection-include-todo t) ; Enable fast access of TODO states
(setq-default org-startup-indented t)                ; Enable indented mode by default

;; linum-mode does not work well in org-mode
(add-hook 'org-mode-hook
          (lambda ()
						(linum-mode -1)))

;; Enable flyspell
(add-hook 'org-mode-hook 'flyspell-mode)

;; Enable auto-fill
(add-hook 'org-mode-hook 'auto-fill-mode)

;; Capture mode
(setq-default org-default-notes-file "notes.org")
(global-set-key (kbd "C-c c") 'org-capture)
(setq-default org-capture-templates
							'(("n" "Note" plain (file+datetree "notes.org")
								 "%U %?\nContext: %A")
								("t" "ToDo" entry (file+headline "todo.org" "Tasks")
								 "* TODO %?\nCreated: %U\nContext: %A")))

;; Attachments
(setq-default org-attach-method 'lns)

(provide 'my_org)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; my_org.el ends here
