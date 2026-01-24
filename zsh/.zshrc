setopt appendhistory
setopt APPEND_HISTORY  
setopt SHARE_HISTORY

export PATH=\
/bin:\
~/.eric_tools/bin:\
~/.dotfiles/bin:\
~/.dotfiles/scripts:\
~/.npm-global/bin:\
~/.claude/local:\
~/.local/bin:\
/bin:\
/sbin:\
/usr/bin:\
/usr/sbin:\
$PATH

[[ -x /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

alias vim=nvim
alias vi=nvim

# git aliases
alias gs="git status --short"
alias ga="git add"
alias gb="git switch"
alias gl="git log"
alias gg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'"

alias gc="git commit"
alias pull="git pull"
alias push="git push"

update_brew() {
  just --working-directory ~/.dotfiles --justfile ~/.dotfiles/justfile brew
}

autoload edit-command-line; zle -N edit-command-line
bindkey -e
bindkey '^X^E' edit-command-line

source <(fzf --zsh)
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
eval "$(oh-my-posh init zsh --config ~/.dotfiles/oh-my-posh/config.yaml)"

export LS_COLORS="$(vivid generate gruvbox-dark-hard)"
alias ls="ls --color"

ZINIT_HOME="${HOME}/.local/share/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"

zinit ice blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

autoload compinit
compinit

zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

zinit light fdellwing/zsh-bat


## fzf-tab
zinit light Aloxaf/fzf-tab
# disable sort when completing `git checkout`

zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# custom fzf flags
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
zstyle ':fzf-tab:*' use-fzf-default-opts yes
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

[[ -f ~/.zshrc_local ]] && source ~/.zshrc_local
export PATH="$HOME/.cargo/bin:$PATH"
