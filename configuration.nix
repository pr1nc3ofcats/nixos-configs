{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.extraHosts = ''
    127.0.0.1 telemetry.microsoft.com
    127.0.0.1 vscodemachinelearning.azureedge.net
  '';

  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Kyiv";
  i18n.defaultLocale = "ru_UA.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "uk_UA.UTF-8";
    LC_IDENTIFICATION = "uk_UA.UTF-8";
    LC_MEASUREMENT = "uk_UA.UTF-8";
    LC_MONETARY = "uk_UA.UTF-8";
    LC_NAME = "uk_UA.UTF-8";
    LC_NUMERIC = "uk_UA.UTF-8";
    LC_PAPER = "uk_UA.UTF-8";
    LC_TELEPHONE = "uk_UA.UTF-8";
    LC_TIME = "uk_UA.UTF-8";
  };

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };

  users.users.zloyk0t = {
    isNormalUser = true;
    description = "ZloyKot";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "wireshark"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDVPS8Sb9kSjjPkp00NpShhr/fNXphkC5Rz2hSa3aCku zloykot@fedora"
    ];
    packages = with pkgs; [
      kdePackages.kate
      kdePackages.filelight
    ];
  };

  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;

  programs.appimage.enable = true;
  programs.appimage.binfmt = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  virtualisation.docker.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };
  services.cloudflare-warp.enable = true;

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamescope.enable = true;
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark-qt;
  };

  # $ nix search wget
  environment.systemPackages = with pkgs; [
  ];

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "25.11";
}
