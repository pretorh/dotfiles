# dot files

## installations

use the `install.sh` script to install, passing the relative path for the item to install (ex `./install.sh common/ssh`) or `common/*` for all in `common`

the `DESTDIR` envvar can be used to set the destination (defaults to `$HOME`)

### sensitive or runtime data

files which should not be tracked in the repo, and preferably not even symlinked into the working dir

- `git` user configs (via `.gitconfig`)
- `gnupg` private keys, keyrings (default dir)
- `ssh` private keys, known hosts (both moved into subdirs in `config`) and private configs (included in `config`)
- `tmux` temp files (todo: move write this into `/tmp`)
- `vim`: run time data for `plugged`, various history files
- `zsh`: history file

## references/links

- [256 colors](https://www.ditig.com/256-colors-cheat-sheet)
- [zsh auto complete](https://thevaluable.dev/zsh-completion-guide-examples/)
