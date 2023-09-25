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

;; Load Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; (load-theme 'zenburn t)
;; (load-theme 'material t)
(load-theme 'nord t)

;; Set up package manager
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(setq package-selected-packages
      '(lsp-mode yasnippet lsp-treemacs helm-lsp projectile hydra flycheck company avy which-key helm-xref dap-mode json-mode)
      )
(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents) ;; TODO: check if this needs to be run on Emacs opening.
  (mapc #'package-install package-selected-packages))

;; Set up modes
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode) 
;; (add-hook 'prog-mode-hook 'highlight-numbers-mode)

;; Set up multiple-cursors
;; Documentation: https://github.com/magnars/multiple-cursors.el
;; Note: You can press C-' to hide all lines without a cursor, press C-' again to unhide.
(unless (package-installed-p 'multiple-cursors)
    (package-install 'multiple-cursors))
(require 'multiple-cursors)
(global-set-key (kbd "C-<right>") 'mc/mark-next-like-this) 
(global-set-key (kbd "C-<left>") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-<down>") 'mc/edit-lines) ;; Create cursors on each line of the selected region
(define-key mc/keymap (kbd "<return>") nil) ;; Disables exiting multiple cursors via <return>. Use C-g to exit.

;; Set up expand-regions
(unless (package-installed-p 'expand-region)
    (package-install 'expand-region))
(use-package expand-region
  :bind ("C-<up>" . er/expand-region))

;; Load the IDE Configuration
(load (concat user-emacs-directory "lib/setup-ide"))

