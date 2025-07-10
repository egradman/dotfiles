remotes:
  cd kitty && uv run remotes.py

ssh name:
  raycast_scripts/kitty.py {{name}}

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
