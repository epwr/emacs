;; Author: Eric Power
;;

;; Get use-package set up
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))

;; Run mac-os config when appropriate
(when (eq system-type 'darwin)
    (load "~/.emacs.d/init-mac-os.el"))

;; UI Setup
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(add-hook 'prog-mode-hook 'display-line-numbers-mode) 
    ;; Load Zenburn Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)


;; Set up the MELPA stable repository
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Set up multiple-cursors
(unless (package-installed-p 'multiple-cursors)
    (package-install 'multiple-cursors))
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-s-c C-s-c") 'mc/edit-lines)


;; Clojure setup
(defvar clojure-packages '(better-defaults
                      projectile
                      clojure-mode
                      ;;cider
		      paredit))

(dolist (p clojure-packages)
  (unless (package-installed-p p)
    (package-install p)))

;; Javascript setup
(defvar js-packages '(js2-mode))
(dolist (p js-packages)
  (unless (package-installed-p p)
    (package-install p)))
;;(use-package ac-js2
;;  :config (progn
;;            (setq ac-js2-evaluate-calls t)
;;            (add-hook 'js2-mode-hook 'ac-js2-mode))
;;  :ensure t)


;; Python
(setq python-shell-interpreter "python3")

;; Jedi (python auto complete)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional
(setq jedi:environment-virtualenv '("/Users/epwr/Library/Python/3.8/bin/virtualenv"))


;; Typescript
(use-package tide :ensure t)
(use-package company :ensure t)
(use-package flycheck :ensure t)
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)
;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)


;; ---------------------------------------------------------------------------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(tide ## js2-mode tern-context-coloring tern-auto-complete tern-autocomplete tern multiple-cursors better-defaults)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
