{ ... }:
{
  wayland.windowManager.mango.settings = {
    windowrule = [
      "isfloating:1,appid:pavucontrol"
      "isfloating:1,appid:blueman-manager"
      "isfloating:1,appid:qalculate-gtk"
      "isfloating:1,appid:file-roller"
    ];

    layerrule = [
      "noanim:1,noblur:1,layer_name:selection"
    ];
  };
}
