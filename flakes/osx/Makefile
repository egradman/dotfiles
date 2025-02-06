run::
	echo "must run personal or red6"

install::
	nix run nix-darwin/master#darwin-rebuild -- switch

build_personal::
	NIXPKGS_ALLOW_UNFREE=1 \
	nix build .#darwinConfigurations.personal.system \
	   --impure --extra-experimental-features 'nix-command flakes'

build_red6::
	NIXPKGS_ALLOW_UNFREE=1 \
	nix build .#darwinConfigurations.red6.system \
	   --impure --extra-experimental-features 'nix-command flakes'

personal::
	NIXPKGS_ALLOW_UNFREE=1 \
	./result/sw/bin/darwin-rebuild switch --impure --flake .#personal

red6::
	NIXPKGS_ALLOW_UNFREE=1 \
	./result/sw/bin/darwin-rebuild switch --impure --flake .#red6

update::
	#nix-channel --update
	nix flake update
