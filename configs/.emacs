;;; .emacs --- emacs configuration file
;; 
;; Filename: .emacs
;; Description: This file is run at emacs startup.
;; Author: Paul Bartholomew
;; Maintainer: Paul Bartholomew
;; Created: Tue Dec 13 09:11:59 2016 (+0000)
;; Version: 0.0
;; Package-Requires: ()
;; Last-Updated: Tue May 29 11:33:30 2018 (+0100)
;;           By: Paul Bartholomew
;;     Update #: 59
;; URL:
;; Doc URL:
;; Keywords:
;; Compatibility:
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Commentary:
;; 
;; First you must install and bootstrap cask with pallet, as a
;; minimum, see lambdacat.org.  My Cask file should be able to do the
;; bootstrap.
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Change Log:
;;
;;  [14-Dec-2016] Moving over to new config files.
;;  [13-Dec-2016] Moving to use header2 to control file changes.
;;  [13-Dec-2016] Adding some of the 'old' config files to bootstrap.
;;  [12-Dec-2016] Initialising with Cask and Pallet.
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

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
 
;;====================================================================
;; Cask and pallet: better package management

(require 'cask "/home/paul/.cask/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

;;====================================================================
;; Load my configs
(add-to-list 'load-path "~/src/my_emacspackages/configs")
(add-to-list 'load-path "~/src/elisp")

;; General configurations
(require 'my_emacs_config) ; Basic emacs configuration file
(require 'my_versioncontrol) ; Version-control configuration

;; Language-specific configurations
(require 'my_elisp)   ; elisp configuration file
(require 'my_clisp)   ; common lisp configuration
(require 'my_LaTeX)   ; LaTeX configuration
(require 'my_org)     ; Org-mode configuration file
(require 'my_python)  ; python configuration (uses anaconda-mode)
(require 'my_cc)      ; C/C++ config
(require 'my_fortran) ; FORTRAN config
(require 'my_rst)     ; ReST config

;;====================================================================
;; evil should be configured last. Also configure keyboard bindings.
(require 'my_kbd)
(require 'my_evil) ; Evil mode configuration file

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown"
												:slant normal :weight normal :height 98
												:width normal))))
 '(writegood-duplicates-face ((t (:foreground "deep pink" :weight bold))))
 '(writegood-passive-voice-face ((t (:foreground "cyan" :weight bold))))
 '(writegood-weasels-face ((t (:foreground "dark orange" :weight bold)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
	 (quote
		(paredit company-bibtex writegood-mode spacemacs-theme solarized-theme slime-company
						 rainbow-delimiters pallet magit helm header2 flycheck-pos-tip evil diff-hl
						 company-auctex company-anaconda)))
 '(user-full-name "Paul Bartholomew")
 '(user-mail-address "paul.bartholomew08@imperial.ac.uk"))

(provide '.emacs)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; .emacs ends here
