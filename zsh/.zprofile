if [ "$IS_MAC_LAPTOP" = true ] ; then
  eval $(/opt/homebrew/bin/brew shellenv)

  ssh-add --apple-use-keychain ~/.ssh/id_rsa

fi

export HISTFILE=$ZDOTDIR/.zhistory
export HISTSIZE=500000
export SAVEHIST=500000

setopt appendhistory
setopt INC_APPEND_HISTORY  
setopt SHARE_HISTORY

alias vim=nvim
alias vi=nvim

alias cat="bat -n"
alias less="bat -n"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $ZDOTDIR/fzf-key-bindings.zsh

export PATH=~/.config_egradman/bin:~/bin:$PATH
source ~/.zprofile_local

export PS1='%m:%~$ '
