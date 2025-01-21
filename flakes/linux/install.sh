nix --extra-experimental-features nix-command profile remove flakes/linux-2
NIXPKGS_ALLOW_UNFREE=1 \
nix --extra-experimental-features "nix-command flakes" profile  install --impure .
