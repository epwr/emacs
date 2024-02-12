# Emacs Setup

My personal emacs setup. 

### Additional Optional Steps:

This setup should work out of the box without addtional setup. However, some tools - particularly the tree sitter support for 
various languages - will require some additional configuration.

1. Go through each `/lib/lang-*.el` file and see what command needs to be run to install the relevant treesiter.
2. Install some CLI tools to help `projectile` do it's stuff: `fd` (faster version of `find`) and `ag` (a better `grep`)

## Keybindings:

A list of keybindings that I've added that are not common enough for me to have memorized when I added them:

| Keybindings | Description                                                | Package    |
|-------------|------------------------------------------------------------|------------|
| s-p f       | search for a file in the project                           | projectile |
| s-p r       | run interactive find & replace on all files in the project | projectile |
| s-p P       | run the standard test suite command, by project type       | projectile |
| s-p p       | show known projects to switch to                           | projectile |
| s-p q       | shown open projects to switch to                           | projectile |
| s-l r r     | Rename the current symbol                                  | lsp-mode   |
| s-l g r     | Show references for the current symbol                     | lsp-mode   |
|             |                                                            |            |


