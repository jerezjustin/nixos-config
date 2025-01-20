{ config, pkgs, userSettings, ... }:

{
  imports = [
    ../../modules/common/home.nix
  ];

  home.username = userSettings.username;
  home.homeDirectory = "/home/${userSettings.username}";

  programs.git = {
    enable = true;
    userName = "Justin Jerez";
    userEmail = "justinjerez@hotmail.com";
  };
}
