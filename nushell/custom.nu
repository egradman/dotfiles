# Check if running on Mac laptop and configure Homebrew and SSH
if ("IS_MAC_LAPTOP" in $env) {
    # Add SSH key to macOS Keychain
    ssh-add --apple-use-keychain ~/.ssh/id_rsa
    $env.HOMEBREW_PREFIX = "/opt/homebrew"
    $env.HOMEBREW_CELLAR = "/opt/homebrew/Cellar"
    $env.HOMEBREW_REPOSITORY = "/opt/homebrew"

#PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/Users/egradman/.dotfiles/bin:/Users/egradman/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/opt/X11/bin:/Library/Apple/usr/bin:/Applications/VMware Fusion.app/Contents/Public:/Applications/kitty.app/Contents/MacOS:/Users/egradman/Library/Python/3.12/bin"; export PATH;
#[ -z "${MANPATH-}" ] || export MANPATH=":${MANPATH#:}";
#export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
}

# Aliases
alias vim = nvim
alias vi = nvim

def less [args: string] {
    let bat_path = (which bat)
    let batcat_path = (which batcat)

    if ($bat_path | is-not-empty) {
        bat $args
    } else if ($batcat_path | is-not-empty) {
        batcat $args
    } else {
        cat $args
    }
}

def watchdir [dirname: string] {
  clear
  loop { clear ; ls $dirname | print ; sleep 1sec }
}

# Update PATH
$env.PATH = (
  $env.PATH
  | split row (char esep)
  | append ~/.dotfiles/bin
  | append ~/bin
  | append ~/.local/bin
  | append ~/go/bin
  | uniq 
)

use bash-env.nu
