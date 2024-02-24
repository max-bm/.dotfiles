# .dotfiles

A repository for storing my personal dotfiles

## Instructions

1. Clone the repository

    ```bash
    git clone git@github.com:max-bm/.dotfiles.git
    cd .dotfiles
    ```

1. (Optional) Run the install script

    ```bash
    ./setup.sh
    ```

1. Run `stow` to create symlinks to the dotfiles

    ```bash
    stow config home # [...]
    ```

## Todo

- Configure prompt (starship?)
- Other: git (lazygit?), neovim, tmux, zoxide, i3/regolith, ...
