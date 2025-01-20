{ config, pkgs, userSettings, ... }:

{
  # Enable docker
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  # Include additional docker related packages
  environment.systemPackages = with pkgs; [
    docker-compose
  ];

  # Include docker in the user groups
  users.users.${userSettings.username} = {
    extraGroups = [ "docker" ];
  };
}
