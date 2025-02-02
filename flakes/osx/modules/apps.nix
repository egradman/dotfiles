{ pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    coreutils
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
    python312
    python312Packages.pip
    python312Packages.virtualenv
    nodejs
    oh-my-posh
    vivid
    httpie


    obsidian
    kitty
    discord
    spotify
    tigervnc
    zoom-us
  ];

  fonts.packages = with pkgs; [
     fira-code
     nerd-fonts.hack
     pkgs.nerd-fonts.fira-code
     pkgs.nerd-fonts.fira-mono
     pkgs.nerd-fonts.meslo-lg
  ];

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

    brews = [
      "sketchybar"
      "ical-buddy"
      "blueutil"
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
      "rectangle"
      "prusaslicer"
    ];
  };
}
