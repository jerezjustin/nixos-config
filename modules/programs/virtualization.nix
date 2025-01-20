{ config, pkgs, userSettings, ... }:

{
  # Enable virtualization support
  virtualisation.libvirtd = {
    enable = true;
    qemu.runAsRoot = true;
  };

  # Install virtualization tools
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    qemu_kvm
    qemu-utils
    libvirt
  ];

  # Kernel modules for KVM and performance
  boot.kernelModules = [
    "kvm"
    "kvm_intel"
    "kvm_amd"
  ];

  # User permissions
  users.users.${userSettings.username}.extraGroups = [ "libvirtd" "kvm" ];
}
