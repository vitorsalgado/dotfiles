export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"

ZSH_THEME="robbyrussell"
DEFAULT_USER=$(whoami)

source $ZSH/oh-my-zsh.sh

plugins=()

export GPG_TTY=$(tty)
export HOMEBREW_NO_ANALYTICS=1
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export HISTCONTROL=ignorespace:ignoredups
export HISTSIZE=10000000
export SAVEHIST=$HISTSIZE
export HISTFILE=~/.zsh_history
export EDITOR="code --wait"
export KUBE_EDITOR="code --wait"
export PATH=$PATH:~/bin
export PATH=$PATH:$(go env GOPATH)/bin

autoload -Uz promptinit && promptinit
autoload -Uz compinit && compinit

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# sdkman
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dots='dotfiles'

[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/.aliases_local" ]] && source "$HOME/.aliases_local"
[[ -f "$HOME/.zshrc_local" ]] && source "$HOME/.zshrc_local"
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# ruby
eval "$(rbenv init - zsh)"

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY
