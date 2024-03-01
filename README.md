# .dotfiles

A repository for storing my personal dotfiles

## Instructions

Clone the repository, change directory, and run the install script:

    ```bash
    git clone git@github.com:max-bm/.dotfiles.git
    cd .dotfiles
    ./setup.sh
    ```

## Todo

- Make `setup.sh` non-interactive for use with devcontainers
- Split `setup.sh` into container-specific and general install
- Configure prompt (starship?)
- Split `setup.sh` into separate scripts (in scripts dir) and only run if necessary
- Other: git (lazygit?), neovim, tmux, zoxide, i3/regolith, ...
