{ pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    #ansible
    bat
    cmake
    cocoapods
    coreutils
    direnv
    entr
    fd
    ffmpeg
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
    luajitPackages.magick
    neovim
    ngrok
    nodejs
    oh-my-posh
    parallel
    pandoc
    ripgrep
    sesh
    sqlite
    sshpass
    tmate
    tmux
    quarto
    tree-sitter
    uv
    vivid
    watch
    wget
    yazi
    zoxide

    websocat
    llm

    firebase-tools

    python312
    python312Packages.pip
    python312Packages.virtualenv

    obsidian
    kitty
    discord
    spotify
    tigervnc
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
      "redis"
      "ollama"
      "wireshark"
      "tcpreplay"
      "whisper-cpp"
      "squid"
      "mavsdk"
      "colima"
      "docker"
      "docker-compose"
      "neo4j"
    ];

    # `brew install --cask`
    casks = [
      "raycast"
      #"foxglove-studio"
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
      "flutter"
      "slack"
      "keyboard-maestro"
      "superwhisper"
      "cleanshot"
      "forklift"
      "iterm2"
     ];
  };
}
