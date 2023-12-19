;; Copyright (C) 2023 Eric Power
;;
;; DESCRIPTION:
;; Sets up the core of the features for my emacs system. UI, package management, etc.
;;
;; REQUIREMENTS:
;; Emacs v29


;; Load mac-os config when appropriate
(when (eq system-type 'darwin)
  (load (concat user-emacs-directory "lib/setup-macos"))) ;; Loads .elc if available, else .el

;; Load the `customise` configuration file.
(load (concat user-emacs-directory "lib/setup-customise"))


;; UI Setup
(setq inhibit-startup-message t)
(setq column-number-mode t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(use-package flx-ido
  :ensure t
  :config
  (require 'flx-ido)
  (ido-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1)
  ;; disable ido faces to see flx highlights.
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces nil))
(setq-default tab-width 4)


;; Backups & Autosaves
(setq backup-by-copying t      ; don't clobber symlinks
      backup-directory-alist '((".*" . "~/.emacs.d/saves/"))    ; don't litter my fs tree
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)       ; use versioned backups
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/saves/" t)))

;; Load Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; (load-theme 'zenburn t)
;; (load-theme 'material t)
(load-theme 'nord t)


;; Set up package manager
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(setq package-selected-packages
      '(lsp-mode flycheck company)
      )
(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents) ;; TODO: check if this needs to be run on Emacs opening.
  (mapc #'package-install package-selected-packages))


;; Set up multiple-cursors
;; Documentation: https://github.com/magnars/multiple-cursors.el
;; Note: You can press C-' to hide all lines without a cursor, press C-' again to unhide.
(use-package multiple-cursors
  :ensure t)
(global-set-key (kbd "C-<right>") 'mc/mark-next-like-this) 
(global-set-key (kbd "C-<left>") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-<down>") 'mc/edit-lines) ;; Create cursors on each line of the selected region
(global-set-key (kbd "C-s-/") 'comment-dwim)	 ;; Comment / uncomment a region, comment a line, align a comment, etc. dwih -> "do what I mean"

(define-key mc/keymap (kbd "<return>") nil) ;; Disables exiting multiple cursors via <return>. Use C-g to exit.


;; Set up expand-regions
(unless (package-installed-p 'expand-region)
    (package-install 'expand-region))
(use-package expand-region
  :bind ("C-<up>" . er/expand-region))


;; Load Final Configuration
(load (concat user-emacs-directory "lib/setup-ide"))
(load (concat user-emacs-directory "lib/setup-dashboard"))

