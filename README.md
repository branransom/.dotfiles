# Setting up dotfiles

My dotfiles setup is based on the approach described here: https://www.atlassian.com/git/tutorials/dotfiles

To install my dotfiles on a new system, follow these steps:

1. Add alias to `.zshrc`: `alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`
2. Ignore folder where dotfiles are stored to avoid weird recursion issues: `echo ".dotfiles" >> .gitignore`
3. Clone the repo: `git clone --bare git@github.com:branransom/dotfiles.git $HOME/.dotfiles`
4. Checkout the repo contents in `$HOME`: `dotfiles checkout`
5. Avoid showing untracked files: `dotfiles config --local status.showUntrackedFiles no`
6. Fetch all submodules (this is required for `vim` plugins, since the plugins are separately managed repos): `dotfiles submodule update --init --recursive`

## Remove a Submodule

To fetch and checkout all submodules

```
dotfiles submodule update --init --recursive
```

To update all submodules, run this command

```
dotfiles submodule update --remote
```

To remove a submodule, run these commands

```
dotfiles submodule deinit <path_to_submodule>
dotfiles rm <path_to_submodule>
```
