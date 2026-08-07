{ ... }:
{
  wayland.windowManager.mango.autostart_sh = ''
    dms run &
    xfce-polkit &
  '';
}
