;; Copyright (C) 2023 Eric Power
;;
;; DESCRIPTION:
;; Configure emacs to be an IDE.
;;
;; REQUIREMENTS:
;; Emacs v29

;; TODO:
;; - Investigate dap-mode (debugger that integrates with lsp-mode)
;; - Find a way to handle venvs (hopefully tied to projectile)


;; Configure LSP
;;
;; Lsp-mode is used instead of eglot as it promises (to be confirmed) that it integrates well with
;; most common packages (eg. company and flycheck)
;; TODO: remove if not needed. (global-unset-key (kbd "s-l")) ;; Remove the keybinding for 'goto-line' so it doesn't conflict
(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "s-l")
  :config
  (setq lsp-prefer-flymake nil) ;; Prefer using lsp-ui (flycheck) over flymake.
  )

;; TODO: setup lsp-ui.
;; Check section 4.1 of https://www.mortens.dev/blog/emacs-and-the-language-server-protocol/index.html


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
  :config
  (setq company-tooltip-align-annotations t
        company-minimum-prefix-length 1
        company-idle-delay 0.1)
  (global-company-mode t) ;; Use company in all buffers
  (with-eval-after-load 'lsp-mode
    (add-hook 'lsp-mode-hook #'company-mode))
  (add-to-list 'company-backends 'company-capf))


;; TODO: setup projectile
(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)) ;; s-p recommended for macos, C-c p for Linux
  :config
  (setq projectile-project-search-path '("~/projs/" ;; set up a list of directories to auto-load projects from.
					 "~/tools/"
					 "~/custom/")
	)
  ) ;; Usage notes: https://docs.projectile.mx/projectile/usage.html#interactive-commands


;; TODO: setup treemacs
;; Worth setting up with projectile & lsp integration.treema






;; Set up rainbow delimiters
(use-package rainbow-delimiters
  :ensure t)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)


;; Set up highlighted indents
;; Causes an issue on load (infinite loop), but the package still works and is great. Just slow to load.
;; Issue tracker: https://github.com/DarthFennec/highlight-indent-guides/issues/122
;;
;; (use-package highlight-indent-guides
;;   :hook 'prog-mode 'highlight-indent-guides-mode
;;   :config
;;   (setq highlight-indent-guides-responsive 'top)
;;   (setq highlight-indent-guides-auto-enabled nil)
;;   )


;; Install each language configuration
(load (concat user-emacs-directory "lib/lang-python"))
(load (concat user-emacs-directory "lib/lang-golang"))

