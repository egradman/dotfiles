if [ "$IS_MAC_LAPTOP" = true ] ; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  ssh-add --apple-use-keychain ~/.ssh/id_rsa
fi

export SHELL=$(which zsh)

export HISTFILE=$ZDOTDIR/.zhistory

export HISTSIZE=500000
export SAVEHIST=500000

export EDITOR=nvim

export PATH=/run/current-system/sw/bin:~/.eric_tools/bin:~/.dotfiles/bin:~/.dotfiles/scripts:~/.local/bin:/run/current-system/sw/bin:$PATH

export PS1='%m:%~$ '
source ~/.zprofile_local
