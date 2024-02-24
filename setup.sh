#!/usr/bin/env bash

# --- INSTALL ZSH --- #
# Ref: https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
if [[ "$OSTYPE" == "linux"* ]]; then
    sudo apt install -y zsh
    chsh -s zsh
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install zsh
    chsh -s /opt/homebrew/bin/zsh
fi
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# --- INSTALL GNU STOW --- #
if [[ "$OSTYPE" == "linux"* ]]; then
    sudo apt install -y stow
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install stow
fi

# --- INSTALL ALACRITTY --- #
# Ref: https://github.com/alacritty/alacritty/blob/master/INSTALL.md
# Clone the source code
git clone https://github.com/alacritty/alacritty.git
cd alacritty
# Install rustup.rs
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# Install ubuntu/debian dependencies
if [[ "$OSTYPE" == "linux"* ]]; then
    sudo apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install scdoc
fi
# Build
if [[ "$OSTYPE" == "linux"* ]]; then
    cargo build --release
elif [[ "$OSTYPE" == "darwin"* ]]; then
    make app
    cp -r target/release/osx/Alacritty.app /Applications/
fi
# Post-build
# Install terminfo
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
# Add desktop entry
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
# Install man pages
sudo mkdir -p /usr/local/share/man/man1
sudo mkdir -p /usr/local/share/man/man5
scdoc < extra/man/alacritty.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
scdoc < extra/man/alacritty-msg.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
scdoc < extra/man/alacritty.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty.5.gz > /dev/null
scdoc < extra/man/alacritty-bindings.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty-bindings.5.gz > /dev/null
# Install (zsh) shell completions
mkdir -p ${ZDOTDIR:-~}/.zsh_functions
echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc
cp extra/completions/_alacritty ${ZDOTDIR:-~}/.zsh_functions/_alacritty

