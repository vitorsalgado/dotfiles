# fig
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"

ZSH_THEME="dracula"

source $ZSH/oh-my-zsh.sh

plugins=(gcloud)

export GPG_TTY=$(tty)
export HOMEBREW_NO_ANALYTICS=1
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='code'
else
    export EDITOR='code'
fi

HISTSIZE=15000
SAVEHIST=15000
HISTCONTROL=ignorespace:ignoredups
HISTFILE=~/.zsh_history
DEFAULT_USER=$(whoami)

setopt HIST_SAVE_NO_DUPS
autoload -Uz promptinit && promptinit
autoload -Uz compinit && compinit

export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$PATH:$GOBIN
export FLUTTER_HOME="$HOME/tools/flutter"
export PATH=$PATH:$FLUTTER_HOME/bin
export PATH=$PATH:"$HOME/tools/" # local tools
export PATH=$PATH:"$HOME/tools/scripts" # jetbrains
export PATH=$PATH:"$HOME/Library/Python/2.7/bin"
export PATH=$PATH:"$HOME/.cargo/bin" # rust
export PATH=$PATH:/Applications/CMake.app/Contents/bin
export PATH=$PATH:"/usr/local/bin/aws_completer" # aws

complete -C '/usr/local/bin/aws_completer' aws

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# asdf
. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit

# sdkman
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ll="ls -l"
alias grep="grep --color"

[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/.zshrc_local" ]] && source "$HOME/.zshrc_local"

eval "$(rbenv init -)" # ruby
eval "$(starship init zsh)" # init starship terminal

# fig
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
