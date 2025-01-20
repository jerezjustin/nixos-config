{ config, pkgs, userSettings, ... }:

{
  # Enable virtualization support
  virtualisation.libvirtd = {
    enable = true;
    qemu.enable = true;
    defaultNetwork = true;
    virtlockd.enable = true;
    virtlogd.enable = true;
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

  # Performance optimizations
  virtualisation = {
    qemu = {
      memoryBacking = {
        hugepages = {
          enable = true;
          size = "2MB";
        };
      };
      vhostNet.enable = true;
    };
  };

  # Networking configuration
  networking.firewall.allowedTCPPorts = [ 5900 16509 ]; # VNC and libvirt ports
  networking.firewall.allowedUDPPorts = [ ];

  # User permissions
  users.users.${userSettings.username}.extraGroups = [ "libvirtd" "kvm" ];

  # Security and AppArmor
  security.apparmor = {
    enable = true;
    enableUnconfined = true;
  };
}
