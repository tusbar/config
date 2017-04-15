;; .emacs

;; Copyright (C) 2008-2017  Bertrand Marron

;; Author: Bertrand Marron <bertrand.marron@gmail.com>
;; Keywords:  lisp

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;; Macros & constants :
(defmacro run-with-x (&rest x)
  (list 'if (eq window-system 'x) (cons 'progn x)))

;; Sets & Custom variables :
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(case-fold-search t)
 '(column-number-mode t)
 '(default-major-mode (quote indented-text-mode) t)
 '(fill-column 72)
 '(frame-title-format "%b" t)
 '(global-font-lock-mode t nil (font-lock))
 '(global-linum-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(linum-format "%4d │ ")
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(next-line-add-newlines nil)
 '(package-enable-at-startup nil)
 '(package-selected-packages (quote (gist)))
 '(require-final-newline t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(version-control t)
 )

(fset 'yes-or-no-p 'y-or-n-p)
(fset 'indent-all-file "\C-xh\234\C-g")

;; Auto modes
;; Example:
;; (add-to-list 'auto-mode-alist '("Dockerfile"    . dockerfile-mode))

;; Packages setup
(setq
 package-list
 '( gist )
 )

(setq
 package-archives
 '( ("gnu"       . "http://elpa.gnu.org/packages/")
    ("marmalade" . "http://marmalade-repo.org/packages/")
    ("melpa"     . "http://melpa.milkbox.net/packages/") )
 )

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(dolist (package package-list)
  (when (not (package-installed-p package))
    (package-install package)))

;; Bindkeys :
(global-set-key "\C-cq"               'indent-all-file)
(global-set-key [delete]              'delete-char)
(global-set-key [backspace]           'delete-backward-char)
(global-set-key [(meta backspace)]    'undo)
(global-set-key [(control backspace)] 'backward-kill-word)
(global-set-key [(control delete)]    'kill-word)
(global-set-key [f6]                  'buffer-menu)
(global-set-key [M-return]            'expand-abbrev)
(global-set-key [?\C-c ?\C-c]         'comment-region)
(global-set-key [?\C-c ?c]            'uncomment-region)
(global-set-key "\C-v"                'pager-page-down)
(global-set-key "\ev"                 'pager-page-up)
(global-set-key '[M-up]               'pager-row-up)

;;EOF
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
