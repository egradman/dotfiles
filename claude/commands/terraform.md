Detect the operating system (macOS, Ubuntu, RHEL/CentOS/Fedora) and install essential development tools (if not already present):

- uv
- just
- bat (batcat)
- ripgrep
- zsh
- zoxide (manual installation from source)
- tmux
- neovim

using the appropriate package manager for each OS unless otherwise indicated

For macOS: use "just brew" command (that will install everything in brew/Brewfile.common)
For Ubuntu: Use apt with manual zoxide installation  
For RHEL/CentOS/Fedora: Use dnf/yum with manual zoxide installation

Set zsh as the default shell if not already configured.
