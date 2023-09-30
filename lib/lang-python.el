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


;; Setup LSP
;; TODO: this will break when I change computers. Unclear why I have to do this, something
;; about MacOS not starting applications from a terminal so the PATH being weird. 
(setq lsp-pylsp-server-command "/Users/epwr/.pyenv/shims/pylsp")

;; Setup Tree Sitter for Python
(use-package python-ts-mode
    :hook ((python-ts-mode . company-mode)
           (python-ts-mode . lsp)
           ;; (python-ts-mode . ) ;; TODO: investigate dap-mode and dap-hydra for debugging
           )
    :mode ("\\.py\\'" . python-ts-mode) ;; Enter python-ts-mode when opening .py files
)
(add-to-list 'lsp-language-id-configuration '(python-ts-mode . "python")) ;; Connect to LSP when entering python-ts-mode

;; Testing out highlighted indents
(use-package highlight-indent-guides
    :ensure t
    :hook (prog-mode . highlight-indent-guides-mode)
    :config
    (setq hightlight-indent-guides-method `column))

