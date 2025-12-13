remotes:
  cd kitty && uv run remotes.py

ssh name:
  raycast_scripts/kitty.py {{name}}

brew_red6:
  brew bundle install --file brew/Brewfile.common --file brew/Brewfile.red6 --

brew_personal:
  brew bundle install --file brew/Brewfile.common --file brew/Brewfile.personal --

sync_dotfiles host:
    rsync -avz \
        --include "tmux/***" \
        --include "nvim/***" \
        --include "zsh/***" \
        --include "direnv/***" \
        --include "scripts/***" \
        --include "oh-my-posh/***" \
        --include "git/***" \
        --include "lnav/linux/***" \
        --include "flakes/***" \
        --exclude='*' \
        ./ {{host}}:.dotfiles/
    scp ~/.zshenv {{host}}:
