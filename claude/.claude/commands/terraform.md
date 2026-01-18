First, ensure that ~/.zshenv contains:

```
export XDG_CONFIG_HOME=~/.dotfiles
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
```

and ensure that ~/.zshrc_local exists (empty is OK)

Detect the operating system (macOS, Ubuntu, RHEL/CentOS/Fedora) and install essential development tools (if not already present):

- uv
- just
- bat (batcat)
- ripgrep
- zsh
- entr
- nvm (node version manager) and then a modern node
- zoxide (manual installation from source)
- tmux
- neovim (use read https://github.com/neovim/neovim/blob/master/INSTALL.md and use a static download, not a package manager version. except on RHEL 8.9 we have to install from source because glibc is too old)
- direnv
- oh-my-posh
- vivid

using the appropriate package manager for each OS unless otherwise indicated

For macOS: use "just brew" command (that will install everything in brew/Brewfile.common)
For Ubuntu: Use apt
For RHEL/CentOS/Fedora: Use dnf/yum 

Set zsh as the default shell if not already configured.

You will probably need my password, so ask me for it and use `sudo -S`
