;;; my_emacs_config.el --- Basic emacs configuration.
;; 
;; Filename: my_emacs_config.el
;; Description: Basic configuration file for emacs.
;; Author: Paul Bartholomew
;; Maintainer: Paul Bartholomew
;; Created: Wed Dec 14 22:23:03 2016 (+0000)
;; Version: 
;; Package-Requires: ()
;; Last-Updated: Wed Dec 14 23:08:50 2016 (+0000)
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
;; This file does basic configuration of emacs. For example,
;; emacs appearance, general behaviours etc.
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Change Log:
;;
;; [14-Dec-2016] Moving backup and autosave directories to
;;               ~/Documents/emacs_backups/ and
;;               ~/Documents/emacs_autosave/ respectively.
;; [14-Dec-2016] Moving old emacs_appearance.el and emacs_behaviour.el
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

;;====================================================================
;; Appearance

;;--------------------------------------------------------------------
;; Set default theme

; misterioso (comes with emacs)
(load-theme 'misterioso)

; solarized (needs to be downloaded, doesnt seem to work)
;(add-to-list 'custom-theme-load-path "~/Dropbox/emacs/themes/emacs-color-theme-solarized-master")
;(load-theme 'solarized t)
;(set-frame-parameter nil 'background-mode 'dark)
;(set-terminal-parameter nil 'background-mode 'dark)
;(enable-theme 'solarized)

;;--------------------------------------------------------------------
;; Tweaks

; Line highlighting
(global-hl-line-mode t)
(set-face-foreground 'highlight nil)

; Disable menu bar
(menu-bar-mode -1)
(tool-bar-mode -1)

; Start full-screen
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

; Disable scroll bar
(scroll-bar-mode -1)

; Line numbering
(global-linum-mode t)
;(set-face-attribute 'linum nil :background "#222222") ; Change background colour of linum
;(setq linum-format "%3d\u2502") ; Adds a line by linum
(setq linum-format "%3d")

;;====================================================================
;; Behaviours

;; Line wrap
(setq-default fill-column 100)

;; Highlight matching parenthesis
(show-paren-mode 1)

;; Tabbing / indentation
(setq-default indent-tabs-mode nil) ; Use spaces instead of tabs
(setq-default tab-always-indent t)
(setq-default tab-width 2) 

;; enable mouse
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (defun track-mouse (e))
  (setq mouse-sel-mode t))

;; electric indent
(electric-indent-mode 1) ; Enable auto-indenting

;; Spell-check
(setq ispell-program-name "aspell")
(setq ispell-dictionary "english")

;;--------------------------------------------------------------------------------------------------

;; Backups
(setq backup-directory-alist `(("." . "~/Documents/emacs_backups"))) ; Set the backup directory
(setq backup-by-copying t) ; Create copies when backing up, helps dealing with symlinks, maybe slow
                           ; in which case look at backup-by-copying-when-linked.
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t) ; Maintain a set of version controlled backups

;; Autosave
(setq auto-save-file-name-transforms
      `((".*" "~/Documents/emacs_autosave/" t))) ; Send autosaves to ~/BACKUPS/emacs/

(provide 'my_emacs_config)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; my_emacs_config.el ends here