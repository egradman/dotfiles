{
  description = "osx";

  nixConfig = {
  };

  # This is the standard format for flake.nix. `inputs` are the dependencies of the flake,
  # Each item in `inputs` will be passed as a parameter to the `outputs` function after being pulled and built.
  inputs = {
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    #nixpkgs.config.allowUnfree = true;
    #nixpkgs.config.allowUnfreePredicate = _: true;
  };

  # The `outputs` function will return all the build results of the flake.
  # A flake can have many use cases and different types of outputs,
  # parameters in `outputs` are defined in `inputs` and can be referenced by their names.
  # However, `self` is an exception, this special parameter points to the `outputs` itself (self-reference)
  # The `@` syntax here is used to alias the attribute set of the inputs's parameter, making it convenient to use inside the function.
  outputs = inputs @ {
    self,
    nixpkgs,
    darwin,
    ...
  }: let
    system = "aarch64-darwin"; # aarch64-darwin or x86_64-darwin

    modules = [
        ./modules/nix-core.nix
        ./modules/system.nix
        ./modules/apps.nix
        ./modules/host-users.nix
    ];


  in {
    darwinConfigurations."personal" = darwin.lib.darwinSystem {
      inherit system;
      inherit modules;
      specialArgs = {
        username = "egradman";
        hostname = "air";
        inherit inputs;
      };
    };

    darwinConfigurations."red6" = darwin.lib.darwinSystem {
      inherit system;
      inherit modules;
      specialArgs = {
        username = "eric.gradman";
        hostname = "smo-adm512";
        inherit inputs;
      };
    };
    # nix code formatter
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
