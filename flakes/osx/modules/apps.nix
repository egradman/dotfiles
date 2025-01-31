{ pkgs, ...}: {

  ##########################################################################
  #
  #  Install all apps and packages here.
  #
  #  NOTE: Your can find all available options in:
  #    https://daiderd.com/nix-darwin/manual/index.html
  #
  # TODO Fell free to modify this file to fit your needs.
  #
  ##########################################################################

  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331

  environment.systemPackages = with pkgs; [
    git
    sshpass
    ansible
    bat
    cmake
    colima
    direnv
    entr
    fd
    ffmpeg
    fzf
    git
    git-crypt
    git-lfs
    htop
    imagemagick
    just
    lnav
    neovim
    pdm
    redis
    ripgrep
    sqlite
    tmate
    tmux
    tree-sitter
    watch
    wget
    yazi
    zoxide
    python312Full
    nodejs
    oh-my-posh


    obsidian
    kitty
    discord
    spotify
    tigervnc
    zoom-us
  ];

  # install a list of fonts
  

  fonts.packages = with pkgs; [
     fira-code
     nerd-fonts.hack
     pkgs.nerd-fonts.fira-code
     pkgs.nerd-fonts.fira-mono
     pkgs.nerd-fonts.meslo-lg
  ];

  # TODO To make this work, homebrew need to be installed manually, see https://brew.sh
  #
  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };

    taps = [
      "homebrew/services"
      "FelixKratz/formulae"

    ];

    # `brew install`
    brews = [
      "sketchybar"
      "ical-buddy"
    ];

    # `brew install --cask`
    casks = [
      "raycast"
      "foxglove-studio"
      "1password"
      "balenaetcher"
      "karabiner-elements"
      "homerow"
      "daisydisk"
      "localsend"
      "blender"
      "qgis"
      "chatgpt"
      "fantastical"
      "qlab"
      "signal"
    ];
  };
}
