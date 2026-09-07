{ pkgs, ... }:
{
  wayland.windowManager.mango.autostart_sh = ''
    noctalia &
    ${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1 &
  '';
}
