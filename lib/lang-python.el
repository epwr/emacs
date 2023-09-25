;; Copyright (C) 2023 Eric Power
;;
;; DESCRIPTION:
;; Configures everything needed for working with python files.
;;
;; When you run this on a new computer:
;; 1. Run `M-x treesit-install-language-grammar python` and build interactively (using all 
;;    defaults should work). This will install the needed grammar and enable `python-ts-mode`.
;; 2. Run (in a terminal, using the global python env) `pip install 'python-lsp-server[all]'`
;;    to set up the language server.
;;
;; REQUIREMENTS:
;; Emacs v29



;; Setup Tree Sitter for Python
(use-package python-ts-mode
    :hook ((python-ts-mode . company-mode)
           (python-ts-mode . lsp)
           ;; (python-ts-mode . ) ;; TODO: investigate dap-mode and dap-hydra for debugging
           )
    :mode ("\\.py\\'" . python-ts-mode) ;; Enter python-ts-mode when opening .py files
)

;; TODO: the following does not make this work. There are two issues:
;; 1. python-mode does not work with lsp-mode because emacs can't find the pylsp command in the path.
;; 2. python-ts-mode is not in the list of clients.
;;    See: `lsp-mode' doesn't have any integration for the language behind `python-ts-mode'. Refer to https://emacs-lsp.github.io/lsp-mode/page/languages and https://langserver.org
;;    See: https://stackoverflow.com/questions/69601017/why-lsp-mode-prompt-command-pyls-is-not-present-on-the-path-in-emacs
(add-to-list 'lsp-language-id-configuration '(python-ts-mode . "python")) ;; Connect to LSP when entering python-ts-mode


;; Set up linters for flycheck

;; Testing out highlighted indents
(use-package highlight-indent-guides
    :ensure t
    :hook (python-ts-mode . highlight-indent-guides-mode)
    :config
    (setq hightlight-indent-guides-method `character)) 
