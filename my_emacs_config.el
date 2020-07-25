;;; my_emacs_config.el --- Basic emacs configuration.
;;
;; Filename: my_emacs_config.el
;; Description: Basic configuration file for emacs.
;; Author: Paul Bartholomew
;; Maintainer: Paul Bartholomew
;; Created: Wed Dec 14 22:23:03 2016 (+0000)
;; Version:
;; Package-Requires: ()
;; Last-Updated: Sat Dec 16 18:48:46 2017 (+0000)
;;					 By: Paul Bartholomew
;;		 Update #: 27
;; URL:
;; Doc URL:
;; Keywords:
;; Compatibility:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; This file does basic configuration of Emacs.	 For example, Emacs
;; appearance, general behaviours etc.	Also loads packages which may
;; be configured later, e.g. company or that require minimal
;; configuration, e.g. flycheck.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;; [14-Dec-2016] Moving backup and autosave directories to
;;							 ~/Documents/emacs_backups/ and
;;							 ~/Documents/emacs_autosave/ respectively.
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
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.	If not, see <http://www.gnu.org/licenses/>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;;====================================================================
;; Appearance

;;--------------------------------------------------------------------
;; Set default theme

; misterioso (comes with emacs)
;(load-theme 'misterioso)

; solarized (needs to be downloaded, doesnt seem to work)
;(add-to-list 'custom-theme-load-path "~/Dropbox/emacs/themes/emacs-color-theme-solarized-master")
;(load-theme 'solarized)
;(set-frame-parameter nil 'background-mode 'dark)
;(set-terminal-parameter nil 'background-mode 'dark)
;(load-theme 'solarized-dark t)
(load-theme 'spacemacs-dark t)

;;--------------------------------------------------------------------
;; Tweaks

;; Line highlighting
(global-hl-line-mode t)
(set-face-foreground 'highlight nil)

;; Disable menu bar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Start full-screen
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Disable scroll bar
(scroll-bar-mode -1)

;; Line numbering
(global-linum-mode t)
;(set-face-attribute 'linum nil :background "#222222") ; Change background colour of linum
;(setq linum-format "%3d\u2502") ; Adds a line by linum
(setq-default linum-format "%3d")

;; Mode line customisation
(defvar my-infoface-colour)
(setq my-infoface-colour "darkolivegreen")
(defface my-infoface
  '((((class color))
     :foreground "darkolivegreen")
    (t :inverse-video t))
  "Grab the colour of `flycheck-info' face."
  :group 'basic-faces)

;(setq-default mode-line-format
;							'("%e"
;								mode-line-front-space
;								(:eval (propertize "(%m) " 'face 'bold))
;								mode-line-buffer-identification " "
;								mode-line-modified
;								" %l:%c |"
;								flycheck-mode-line
;								(:eval (propertize "FOO" 'face 'my-infoface))
;								))
(setq-default evil-mode-line-format
	      '(before . mode-line-front-space))

;;====================================================================
;; Behaviours

;; Line wrap
(setq-default fill-column 100)

;; Highlight matching parenthesis
(show-paren-mode 1)
(require 'paren)
(set-face-background 'show-paren-match (face-background 'hl-line))
(set-face-attribute 'show-paren-match nil :weight 'ultra-bold)

;; Highlight TODO, XXX, FIXME
(defun my_highlight-todos ()
  (font-lock-add-keywords nil
			  '(("\\<\\(TODO\\|XXX\\):" 1 font-lock-warning-face t))))
(add-hook 'prog-mode-hook 'my_highlight-todos)

;; Auto-close parentheses
(electric-pair-mode 1)

;; Rainbow-coloured brackes
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; ;; Tabbing / indentation
;; (setq-default indent-tabs-mode t)
;; (setq-default tab-always-indent t)
;; (setq-default tab-width 2)

;; enable mouse
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (defun track-mouse (e))
  (setq-default mouse-sel-mode t))

;; electric indent
(electric-indent-mode 1) ; Enable auto-indenting

;; Spell-check
(setq-default ispell-program-name "aspell")
(setq-default ispell-dictionary "british")
(setq-default ispell-personal-dictionary "~/.my_dictionary")

;; Blink cursor forever
;(blink-cursor-mode -1) ; Zero or negative value blinks forever

;; Disale cursor blink in docview mode
(add-hook 'doc-view-mode
	  (lambda ()
	    (blink-cursor-mode 0)))
(add-hook 'doc-view-mode 'doc-view-fit-width-to-window)
(setq-default doc-view-resolution 300)

;;--------------------------------------------------------------------

;; Disable backups and autosave
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Delete trailing-whitespace
;(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;====================================================================
;; Load packages with minimal configurations

;; Company-mode (autocompletions)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 2)
(setq company-backends
      (remove 'company-dabbrev company-backends)) ; dabbrev is annoying!

;; flycheck
(require 'flycheck)
(global-flycheck-mode)
(setq-default flycheck-emacs-lisp-load-path 'inherit) ; This should prevent "I can't find this file" errors/warnings
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

;; flyspell
(setq-default ispell-dictionary "british")

;; helm
;(require 'helm-config)

;; EasyPG
;; Enables encryption
;; (require 'epa-file)
(epa-file-enable)

;;====================================================================
;; File associations
(add-to-list 'auto-mode-alist '("\\.cl\\'" . lisp-mode))

(provide 'my_emacs_config)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; my_emacs_config.el ends here
