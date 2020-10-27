;;; my_org.el --- org-mode config.
;; 
;; Filename: my_org.el
;; Description: Configures org-mode
;; Author: Paul Bartholomew
;; Maintainer: Paul Bartholomew
;; Created: Wed Dec 14 22:16:58 2016 (+0000)
;; Version: 0.0
;; Package-Requires: ()
;; Last-Updated: Thu May 24 11:28:01 2018 (+0100)
;;           By: Paul Bartholomew
;;     Update #: 76
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
(setq-default org-directory "~/Documents/org/")
(setq-default org-agenda-files '("~/Documents/org/"))
(require '.org-locals "~/.org-locals.el" t)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(setq-default org-enforce-todo-dependencies t)       ; Enforces that a parent can only be DONE
                                                     ; when all children are DONE
(setq-default org-log-done 'time)                    ; Track time when tasks complete
(setq-default org-log-reschedule 'time)              ; Track time when tasks rescheduled
(setq-default org-fast-tag-selection-include-todo t) ; Enable fast access of TODO states
(setq-default org-startup-indented t)                ; Enable indented mode by default
(setq-default org-hide-emphasis-markers t)           ; Hides // ** etc.
(setq-default org-pretty-entities t)                 ; Pretty print \rho using UTF8
(setq-default org-refile-use-outline-path "full-file-path") ; Refile using a file-path
(setq-default org-export-with-smart-quotes t)        ; Do the right thing with apostrophes

;; Set LaTeX compiler
(setq org-latex-pdf-process (list "latexmk -f -pdf %f"))
;; Enable BibTeX
(require 'org-ref)
(setq org-ref-default-bibliography "~/OneDrive - University of Edinburgh/Documents/Bibliography/library.bib")

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
		 "* TODO %?\nCreated: %U\nContext: %A")
		("s" "Someday / Maybe" plain (file "someday.org")
		 "* %?\nCreated: %U\nContext: %A")
		("l" "Log" plain (file+datetree "log.org")
		 "%?\nContext: %A")
		("e" "EPCC Log" plain (file+datetree "epcc.org" "Log")
		 "%?\nContext: %A")
		("w" "Work task" entry (file+headline "epcc.org" "Tasks")
		 "* TODO %?\nCreated: %U\nContext: %A")))

;; Attachments
(setq-default org-attach-method 'lns)

;; Exporting
(add-hook 'org-mode-hook
	  '(lambda ()
	     (delete '("\\.pdf\\'" .default) org-file-apps)
	     (cond ((string-equal system-type "darwin")
		    (add-to-list 'org-file-apps '("\\.pdf" . "open %s")))
		   ((string-equal system-type "gnu/linux")
		    (add-to-list 'org-file-apps '("\\.pdf\\'" . "okular %s"))))))

;; Highlight LaTeX
(eval-after-load 'org
  '(setf org-highlight-latex-and-related '(latex)))

;; Better looking bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda ()
			   (org-bullets-mode t)))

;; Pomodoro
(require 'org-pomodoro)

;; Evaluating code blocks
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (scheme . t)))

;; Custom export
(require 'ox-publish)
(setq org-publish-project-alist
      '(("blog-org"
	 :base-directory "~/src/blog/_org"
	 :base-extension "org"
	 :publishing-directory "~/src/blog"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4
	 :html-extension "html"
	 :with-toc nil
	 :body-only t)
	("blog-static"
	 :base-directory "~/src/blog/_org"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
	 :publishing-directory "~/src/blog"
	 :recursive t
	 :publishing-function org-publish-attachment)
	("blog" :components ("blog-org"
			     "blog-static"))))

;; JEKYLL requires absolute (relative to it's root paths to assets e.g. images)
(defun org-custom-link-img-follow (path)
  (org-open-file-with-emacs
   (format "../assets/%s" path)))

(defun org-custom-link-img-export (path desc format)
  (cond
   ((eq format 'html)
    (format "<img src=\"/assets/%s\" alt=\"%s\"/>" path desc))))

(org-link-set-parameters "img"
			 :follow 'org-custom-link-img-follow
			 :export 'org-custom-link-img-export)


(provide 'my_org)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; my_org.el ends here
