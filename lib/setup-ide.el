;; Copyright (C) 2023 Eric Power
;;
;; DESCRIPTION:
;; Configure emacs to be an IDE.
;;
;; REQUIREMENTS:
;; Emacs v29

;; TODO:
;; - Investigate dap-mode (debugger that integrates with lsp-mode)
;; - Investigate projectile (enables the concept of projects)
;; - Find a way to handle venvs (hopefully tied to projectile)


;; Configure LSP
;;
;; Lsp-mode is used instead of eglot as it promises (to be confirmed) that it integrates well with
;; most common packages (eg. company and flycheck)
(use-package lsp-mode
    :ensure t)
;; (setq 
;;    lsp-pyls-server-command "sh /Users/epwr/.pyenv/shims/pylsp")


;; Configure flycheck
;;
;; flycheck is used instead of flymake because of the lsp-mode & flycheck integration.
;;
;; Flycheck relies on installed linters. Check the following link for a list of supported
;; linters:
;; https://www.flycheck.org/en/latest/languages.html#flycheck-languages
(use-package flycheck
    :ensure t)
(global-flycheck-mode)


;; Configure `company`
;;
;; `company` is a tool that provides auto-complete.
(use-package company
  :ensure t
  :hook (after-init . global-company-mode) ;; Use company in all buffers
  :config
  (setq company-tooltip-align-annotations t
        company-minimum-prefix-length 1
        company-idle-delay 0.0)
  (with-eval-after-load 'lsp-mode
    (add-hook 'lsp-mode-hook #'company-mode))
  (add-to-list 'company-backends 'company-capf))


;; Install each language configuration
(load (concat user-emacs-directory "lib/lang-python"))