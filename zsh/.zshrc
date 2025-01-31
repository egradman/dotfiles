setopt appendhistory
setopt APPEND_HISTORY  
setopt SHARE_HISTORY

export PATH=/run/current-system/sw/bin:~/.nix-profile/bin:/opt/homebrew/bin:~/.eric_tools/bin:~/.dotfiles/bin:~/.dotfiles/scripts:~/.local/bin::$PATH

alias vim=nvim
alias vi=nvim
alias cat="bat -n"
alias less="bat -n"

autoload edit-command-line; zle -N edit-command-line
bindkey '^X^E' edit-command-line

source <(fzf --zsh)
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
eval "$(oh-my-posh init zsh --config ~/.dotfiles/oh-my-posh/config.yaml)"


