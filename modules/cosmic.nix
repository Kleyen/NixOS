{ ... }:
{
  services.desktopManager.cosmic = {
    enable = true;
    xwayland.enable = true;
  };

  # Do NOT enable cosmic-greeter — you're keeping SDDM.
  # SDDM auto-lists a "COSMIC" session once the module is active;
  # no displayManager change needed.

  # Lets clipboard managers (yours, given DMS/Noctalia) work across COSMIC too
  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = "1";

  services.gnome.gnome-keyring.enable = true; # portals/secrets for GTK apps under cosmic-comp
}
