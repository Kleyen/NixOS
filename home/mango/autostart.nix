{ pkgs, ... }:
{
  wayland.windowManager.mango.autostart_sh = ''
    dms run &
    ${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1 &
  '';
}
