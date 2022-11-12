export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"

ZSH_THEME="dracula"

source $ZSH/oh-my-zsh.sh

plugins=()

export GPG_TTY=$(tty)
export HOMEBREW_NO_ANALYTICS=1
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='code'
else
    export EDITOR='code'
fi

HISTSIZE=30000
SAVEHIST=30000
HISTCONTROL=ignorespace:ignoredups
HISTFILE=~/.zsh_history
DEFAULT_USER=$(whoami)

setopt HIST_SAVE_NO_DUPS

export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$PATH:$GOBIN

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -Uz promptinit && promptinit
autoload -Uz compinit && compinit

# sdkman
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dots='dotfiles'

[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/.aliases_local" ]] && source "$HOME/.aliases_local"
[[ -f "$HOME/.zshrc_local" ]] && source "$HOME/.zshrc_local"

eval "$(rbenv init - zsh)" # ruby
eval "$(starship init zsh)" # init starship terminal
