{ config, pkgs, userSettings, ... }:

{
  imports = [
    ../../modules/common/home.nix
  ];

  home.username = userSettings.username;
  home.homeDirectory = "/home/${userSettings.username}";

  programs.git = {
    enable = true;
    userName = userSettings.name;
    userEmail = userSettings.email;
  };
}
