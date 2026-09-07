{ pkgs, ... }:

{
  # Enable libvirtd daemon
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
    };
  };

  # Enable SPICE USB redirection (fixes "spice-client-glib-usb-acl-helper" errors in virt-manager)
  virtualisation.spiceUSBRedirection.enable = true;

  # Automatically grant your user KVM and libvirt permissions
  users.users.denver.extraGroups = [ "kvm" "libvirtd" ];

  # Install required system packages
  environment.systemPackages = with pkgs; [
    qemu
    OVMF
    virt-manager
  ];
}
