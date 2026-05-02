{ pkgs, unstable, ... }:
{
  environment.systemPackages = with pkgs; [
    micro
    vim
    git

    # taskbar
    discord
    wezterm
    vivaldi
    vivaldi-ffmpeg-codecs
    telegram-desktop

    # tak prosto
    onlyoffice-desktopeditors
    clementine
    keepassxc
    inkscape
    qbittorrent
    lutris
    obs-studio
    texstudio
    termusic

    # utils
    audacity
    ventoy-full
    btop
    lazygit
    lazydocker
    nerd-fonts.jetbrains-mono
    fastfetch
    fzf
    fd
    ripgrep
    zsh
    zip
    unzip
    stow
    cloudflare-warp
    gh
    direnv
    nix-direnv
    nixfmt
  ] ++ (with unstable; [
    # unstable packages
    hexchat	
    vscode
    kicad
  ]
  );

  nixpkgs.config.permittedInsecurePackages = [
  	"ventoy-1.1.10"
  ];
}
