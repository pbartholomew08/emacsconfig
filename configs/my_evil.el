;;; my_evil.el --- evil config file.
;; 
;; Filename: my_evil.el
;; Description: Configures evil.
;; Author: Paul Bartholomew
;; Maintainer: Paul Bartholomew
;; Created: Wed Dec 14 22:19:38 2016 (+0000)
;; Version: 
;; Package-Requires: ()
;; Last-Updated: Wed Dec 14 22:21:50 2016 (+0000)
;;           By: Paul Bartholomew
;;     Update #: 3
;; URL: 
;; Doc URL: 
;; Keywords: 
;; Compatibility: 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Commentary: 
;; 
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! This code MUST be loaded last!                              !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Change Log:
;;
;; [14-Dec-2016] Implementing previous config.
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

(setq evil-want-C-i-jump nil) ; stops evil breaking org
(require 'evil)
(evil-mode 1)
(eval-after-load "evil"
  '(progn
     (define-key evil-normal-state-map (kbd "C-w <right>") 'evil-window-right)
     (define-key evil-normal-state-map (kbd "C-w <left>") 'evil-window-left)
     (define-key evil-normal-state-map (kbd "C-w <down>") 'evil-window-down)
     (define-key evil-normal-state-map (kbd "C-w <up>") 'evil-window-up)
     (define-key evil-normal-state-map (kbd "C-/") 'comment-dwim)
  ))

(provide 'my_evil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; my_evil.el ends here
