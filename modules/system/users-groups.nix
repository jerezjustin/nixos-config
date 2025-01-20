{ config, pkgs, userSettings, ... }:

{
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    home = "/home/${userSettings.username}";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
