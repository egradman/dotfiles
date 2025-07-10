remotes:
  cd kitty && uv run remotes.py

ssh name:
  raycast_scripts/kitty.py {{name}}

brew:
  brew bundle install --file brew/Brewfile.common
