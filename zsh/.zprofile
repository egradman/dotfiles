if [ "$IS_MAC_LAPTOP" = true ] ; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  ssh-add --apple-use-keychain ~/.ssh/id_rsa
fi

export SHELL=$(which zsh)

export HISTFILE=$ZDOTDIR/.zhistory

export HISTSIZE=500000
export SAVEHIST=500000

export CLAUDE_CONFIG_DIR=~/.dotfiles/claude

export EDITOR=nvim

export PATH=~/.eric_tools/bin:~/.dotfiles/bin:~/.dotfiles/scripts:~/.npm-global/bin:~/.local/bin:~/.claude/local:/run/current-system/sw/bin:/bin:~/.claude/local/claude:$PATH:/usr/sbin:/sbin:/bin


export PS1='%m:%~$ '

if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi
source ~/.dotfiles/zsh/.zshrc
source ~/.zprofile_local

