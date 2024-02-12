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
;; 3. Run (in a terminal) the following:
;;    - `go install github.com/go-delve/delve/cmd/dlv@latest` to install
;;      delve, the go debugger.
;;    - `sudo /usr/sbin/DevToolsSecurity -enable` and
;;      `sudo dscl . append /Groups/_developer GroupMembership $(whoami)`
;;      to enable developer mode & add yourself to the developer group.
;;
;; REQUIREMENTS:
;; Emacs v29


;; Setup LSP
(add-hook 'go-ts-mode-hook #'lsp-deferred)
(add-hook 'go-ts-mode-hook 'company-mode)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-ts-mode))

;; Setup dap-mode debugger
(require 'dap-dlv-go)
;; https://emacs-lsp.github.io/dap-mode/page/configuration/#go

(setq go-ts-mode-indent-offset 4)
