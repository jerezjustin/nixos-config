{ config, pkgs, userSettings, ... }:

{
  home.stateVersion = "24.05";

  home.packages = (with pkgs; [
    # Gnome 
    gnome-tweaks
    gnome-shell
    gnomeExtensions.forge
    gnomeExtensions.user-themes

    # Packages for development
    beekeeper-studio
    git
    postman
    vim
    vscode

    # System tools
    gparted
    htop

    # Productivity
    obsidian

    # Communication
    teamviewer
    webcord
  ]);

  # Enable Firefox for all users
  programs.firefox.enable = true;

  home.file = { };

  home.sessionVariables = { };

  programs.home-manager.enable = true;
}
