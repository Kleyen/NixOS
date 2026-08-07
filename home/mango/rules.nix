{ ... }:
{
  wayland.windowManager.mango.settings = {

    windowrule = [
      "isfloating:1,appid:pavucontrol"
      "isfloating:1,appid:blueman-manager"
      "isfloating:1,appid:qalculate-gtk"
      "isfloating:1,appid:file-roller"
    ];

    # DMS panels are quickshell layer-shell surfaces, not regular windows -
    # if you want to tweak how one opens/closes, find its exact layer name
    # first with: mmsg get last_open_surface
    layerrule = [
      "noanim:1,noblur:1,layer_name:selection"
    ];
  };
}
