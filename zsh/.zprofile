if [ "$IS_MAC_LAPTOP" = true ] ; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  ssh-add --apple-use-keychain ~/.ssh/id_rsa
fi

export SHELL=$(which zsh)

export HISTFILE=$ZDOTDIR/.zhistory

export HISTSIZE=500000
export SAVEHIST=500000

export EDITOR=nvim

if [ -e /home/rsadmi/.nix-profile/etc/profile.d/nix.sh ]; then . /home/rsadmi/.nix-profile/etc/profile.d/nix.sh; fi

export PATH=/run/current-system/sw/bin:~/.nix-profile/bin:~/.eric_tools/bin:~/.dotfiles/bin:~/.dotfiles/scripts:~/.local/bin:/run/current-system/sw/bin:$PATH


export PS1='%m:%~$ '

if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi
source ~/.zprofile_local
