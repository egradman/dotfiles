deploy:
	nix build .#darwinConfigurations.egradman-personal.system \
	   --extra-experimental-features 'nix-command flakes'

	./result/sw/bin/darwin-rebuild switch --flake .#egradman-personal
