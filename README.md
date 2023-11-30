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

### Additional Optional Steps:

1. Go through each `/lib/lang-*.el` file and see what command needs to be run to install the relevant treesiter.
2. Install some CLI tools to help `projectile` do it's stuff: `fd` (faster version of `find`) and `ag` (a better `grep`)

## Known Issues:

## Keybindings:


| Keybindings | Description                                                | Package    |
|-------------|------------------------------------------------------------|------------|
| s-p f       | search for a file in the project                           | projectile |
| s-p r       | run interactive find & replace on all files in the project | projectile |
| s-p P       | run the standard test suite command, by project type       | projectile |
| s-p p       | show known projects to switch to                           | projectile |
| s-p q       | shown open projects to switch to                           | projectile |
| s-l         |                                                            |            |


