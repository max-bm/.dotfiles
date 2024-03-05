export PATH=$HOME/bin:$HOME/.cargo/bin:/usr/local/bin:$PATH
if [[ "$OSTYPE" == "darwin"* ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
plugins=(git)
source $ZSH/oh-my-zsh.sh
fpath+=${ZDOTDIR:-~}/.zsh_functions
eval "$(starship init zsh)"
if [[ "$OSTYPE" == "linux"* ]]; then
    eval "$(ssh-agent -s)" >/dev/null 2>/dev/null
    ssh-add ~/.ssh/cts_id_rsa >/dev/null 2>/dev/null
fi
