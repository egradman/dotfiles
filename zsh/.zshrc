setopt appendhistory
setopt APPEND_HISTORY  
setopt SHARE_HISTORY

alias vim=nvim
alias vi=nvim
alias cat="bat -n"
alias less="bat -n"

autoload edit-command-line; zle -N edit-command-line
bindkey '^X^E' edit-command-line

eval "$(direnv hook zsh)"
