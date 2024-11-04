if [ "$IS_MAC_LAPTOP" = true ] ; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  ssh-add --apple-use-keychain ~/.ssh/id_rsa

fi

export HISTFILE=$ZDOTDIR/.zhistory
export HISTSIZE=500000
export SAVEHIST=500000

setopt appendhistory
setopt APPEND_HISTORY  
setopt SHARE_HISTORY

alias vim=nvim
alias vi=nvim
alias cat="bat -n"
alias less="bat -n"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $ZDOTDIR/fzf-key-bindings.zsh

source ~/.zprofile_local
export PATH=~/.dotfiles/bin:~/bin:$PATH
source ~/.zprofile_local

autoload edit-command-line; zle -N edit-command-line
bindkey '^X^E' edit-command-line

export PS1='%m:%~$ '
eval "$(direnv hook zsh)"

