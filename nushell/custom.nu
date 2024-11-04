# Check if running on Mac laptop and configure Homebrew and SSH
if $env.IS_MAC_LAPTOP == "true" {
    # Set up Homebrew environment
    let brew_cmd = "/opt/homebrew/bin/brew shellenv" | run
    eval $brew_cmd

    # Add SSH key to macOS Keychain
    ssh-add --apple-use-keychain ~/.ssh/id_rsa
}

# Aliases
alias vim = nvim
alias vi = nvim
alias cat = bat -n
alias less = bat -n

# Update PATH
$env.PATH = (
  $env.PATH
  | split row (char esep)
  | append ~/.dotfiles/bin
  | append ~/bin
  | uniq 
)


# Enable `direnv` if it's available
if (command exists direnv) {
    eval (direnv hook nu)
}

$env.HOMEBREW_PREFIX="/opt/homebrew"
$env.HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew";
PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/Users/egradman/.dotfiles/bin:/Users/egradman/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/opt/X11/bin:/Library/Apple/usr/bin:/Applications/VMware Fusion.app/Contents/Public:/Applications/kitty.app/Contents/MacOS:/Users/egradman/Library/Python/3.12/bin"; export PATH;
[ -z "${MANPATH-}" ] || export MANPATH=":${MANPATH#:}";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
