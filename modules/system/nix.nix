{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable unfree packages
  nixpkgs.config.allowUnfree = true;

  # Garbage collection configuration
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";
  nix.gc.options = "--delete-older-than 30d";

  system.stateVersion = "24.11";
}	
