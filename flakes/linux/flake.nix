{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixgl.url = "github:nix-community/nixGL";
  };


  outputs = { self, nixpkgs, nixgl }:
    let pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [nixgl.overlay];
        config = { allowUnfree = true; };
      };
    in {
      packages."x86_64-linux".default = pkgs.buildEnv {
        name = "home-packages";
        paths = import ./tools.nix {pkgs=pkgs;} ++ [
          pkgs.nixgl.nixGLIntel
          pkgs.ulauncher
          pkgs.gnome-tweaks
          pkgs.zsh
          "pkgs.google-chrome-stable"
        ];
      };
    };
}

