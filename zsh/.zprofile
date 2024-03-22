if [ "$IS_MAC_LAPTOP" = true ] ; then
  eval $(/opt/homebrew/bin/brew shellenv)

  ssh-add --apple-use-keychain ~/.ssh/id_rsa

fi

alias vim=nvim
alias vi=nvim
alias cat="bat -n"
alias less="bat -n"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh

source ~/.zprofile_local
export PATH=~/.config_egradman/bin:~/bin:$PATH
