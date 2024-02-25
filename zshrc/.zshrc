export PATH=$HOME/bin:$HOME/.cargo/bin:/usr/local/bin:$PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
plugins=(git)
source $ZSH/oh-my-zsh.sh
fpath+=${ZDOTDIR:-~}/.zsh_functions
eval "$(starship init zsh)"
