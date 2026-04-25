{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  networking.hostName = "pr1nc3ofcats";

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };
}