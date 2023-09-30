# Emacs Setup


## Fresh Installation

Once you have a new version of emacs setup, run the following commands:

In emacs:

```elisp
M-x treesit-install-language-grammar python
```

In terminal (using global python env):

```bash
pip install 'python-lsp-server[all]'
```

### Known Issues:

Currently:
 - DAP throws a bunch of errors, I need to deal with these once I set up DAP properly
 - Getting the error: "No such file or directory, rainbow-delimiters"