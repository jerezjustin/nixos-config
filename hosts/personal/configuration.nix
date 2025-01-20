{ config, pkgs, userSettings, ... }:

{
  imports = [
    ../../modules/system/hardware-configuration.nix
    ../../modules/system/boot.nix
    ../../modules/system/gnome.nix
    ../../modules/system/locale.nix
    ../../modules/system/network.nix
    ../../modules/system/nix.nix
    ../../modules/system/pipewire.nix
    ../../modules/system/services.nix
    ../../modules/system/users-groups.nix
    ../../modules/programs/docker.nix
    ../..
  ];

  networking.hostName = userSettings.username;
}
