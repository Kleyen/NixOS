{ ... }:

{
  services.power-profiles-daemon.enable = true;
  services.accounts-daemon.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  services.blueman.enable = true;

  # Registers the dconf D-Bus service as activatable. Without this,
  # home-manager's "Activating dconfSettings" step fails with
  # GDBus.Error:org.freedesktop.DBus.Error.ServiceUnknown, because
  # gtk.enable = true (in home/theming.nix) writes GTK settings via dconf.
  programs.dconf.enable = true;
}
