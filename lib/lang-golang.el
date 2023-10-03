;; Copyright (C) 2023 Eric Power
;;
;; DESCRIPTION:
;; Configures everything needed for working with Go files.
;;
;; When you run this on a new computer:
;; 1. Run `M-x treesit-install-language-grammar go` and `M-x treesit-install-language-grammar go` and
;;    build them interactively (using all defaults should work). This will install the needed grammar
;;    and enable `go-ts-mode`.
;; 2. Run (in a terminal) `go install golang.org/x/tools/gopls@latest`
;;    to set up the language server.
;;
;; REQUIREMENTS:
;; Emacs v29


;; Setup LSP
(add-hook 'go-ts-mode-hook #'lsp-deferred)
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-ts-mode-hook #'lsp-go-install-save-hooks)
;; (add-to-list 'lsp-language-id-configuration '(go-ts-mode . "go")) ;; Connect to LSP when entering go-ts-mode

;; Setup Tree Sitter
;; (use-package go-ts-mode
;;   :hook ((go-ts-mode . company-mode)
;; 	 (go-ts-mode . lsp)
;; 	 )
;;   :mode ("\\.go\\'" . go-ts-mode)
;;   )
  
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-ts-mode))
(add-hook 'go-ts-mode 'company-mode)
(add-hook 'go-ts-mode #'lsp-deferred)

(setq go-ts-mode-indent-offset 4)
