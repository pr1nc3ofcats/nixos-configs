{ pkgs, unstable, ... }:
{
  environment.systemPackages = with pkgs; [
    micro
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
  ]
  );

  nixpkgs.config.permittedInsecurePackages = [
  	"ventoy-1.1.10"
  ];
}
