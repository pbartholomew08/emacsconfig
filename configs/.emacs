;;; .emacs --- emacs configuration file
;; 
;; Filename: .emacs
;; Description: This file is run at emacs startup.
;; Author: Paul Bartholomew
;; Maintainer: Paul Bartholomew
;; Created: Tue Dec 13 09:11:59 2016 (+0000)
;; Version: 0.0
;; Package-Requires: ()
;; Last-Updated: Thu Dec 22 22:19:59 2016 (+0000)
;;           By: Paul Bartholomew
;;     Update #: 40
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
 
;;=================================================================================================
;; Cask and pallet: better package management
(require 'cask "/home/paul/.cask/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

;;=================================================================================================
;; Load my configs
(add-to-list 'load-path "~/src/my_emacspackages/configs")

;; General configurations
(require 'my_emacs_config) ; Basic emacs configuration file
(require 'my_versioncontrol) ; Version-control configuration

;; Language-specific configurations
(require 'my_elisp) ; elisp configuration file
(require 'my_clisp) ; common lisp configuration
(require 'my_LaTeX)
(require 'my_org) ; Org-mode configuration file
(require 'my_python) ; python configuration (uses anaconda-mode)
(require 'my_cc) ; C/C++ config

;;=================================================================================================
;; evil should be configured last. Also configure keyboard bindings.
(require 'my_kbd)
(require 'my_evil) ; Evil mode configuration file

(provide '.emacs)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; .emacs ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono for Powerline" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))
