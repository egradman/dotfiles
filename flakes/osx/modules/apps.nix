{ pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    ansible
    bat
    cmake
    colima
    coreutils
    direnv
    entr
    fd
    ffmpeg
    flutter
    fzf
    gh
    git
    git
    git-crypt
    git-lfs
    htop
    httpie
    imagemagick
    just
    lnav
    neovim
    ngrok
    nodejs
    oh-my-posh
    parallel
    redis
    ripgrep
    sqlite
    sshpass
    tmate
    tmux
    tree-sitter
    vivid
    watch
    wget
    yazi
    zoxide

    pdm
    python312
    python312Packages.pip
    python312Packages.virtualenv

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
      "opus"
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
