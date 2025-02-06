setopt appendhistory
setopt APPEND_HISTORY  
setopt SHARE_HISTORY

export PATH=/run/current-system/sw/bin:~/.nix-profile/bin:/opt/homebrew/bin:~/.eric_tools/bin:~/.dotfiles/bin:~/.dotfiles/scripts:~/.local/bin::$PATH


alias vim=nvim
alias vi=nvim
#alias cat="bat -n"
#alias less="bat -n"
alias pdm_shell="nix-shell -p python312Packages.virtualenv"
alias apps="vi ~/.dotfiles/flakes/osx/modules/apps.nix"

autoload edit-command-line; zle -N edit-command-line
bindkey '^X^E' edit-command-line

source <(fzf --zsh)
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
eval "$(oh-my-posh init zsh --config ~/.dotfiles/oh-my-posh/config.yaml)"

export LS_COLORS="$(vivid generate gruvbox-dark-hard)"
alias ls="ls --color"

ZINIT_HOME="${XDG_CONFIG_HOME}/zinit/zinit.git"
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
