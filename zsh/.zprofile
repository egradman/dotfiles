if [ "$IS_MAC_LAPTOP" = true ] ; then
  eval $(/opt/homebrew/bin/brew shellenv)

  eval "$(ssh-agent -s)"

  ssh-add ~/.ssh/id_rsa

  source ~/.zprofile_local
fi

alias vim=nvim
alias vi=nvim
alias cat="bat -n"
alias less="bat -n"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=~/bin/nvim-linux64/bin:$PATH
