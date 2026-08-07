{ lib, ... }:
let
  # CTRL+n -> view tag n, ALT+n -> move focused window to tag n (Number row)
  tagBinds = lib.flatten (map (n: [
    "CTRL,${toString n},view,${toString n}"
    "ALT,${toString n},tag,${toString n}"
  ]) (lib.range 1 9));

  # Numpad keysyms (NumLock OFF state) for 1 through 9
  numpadKeys = [
    "KP_End"   # 1
    "KP_Down"  # 2
    "KP_Next"  # 3
    "KP_Left"  # 4
    "KP_Begin" # 5
    "KP_Right" # 6
    "KP_Home"  # 7
    "KP_Up"    # 8
    "KP_Prior" # 9
  ];

  # Iterates 1-indexed to generate CTRL+KP_End -> view 1, etc.
  numpadBinds = lib.flatten (lib.imap1 (i: key: [
    "CTRL,${key},view,${toString i}"
    "ALT,${key},tag,${toString i}"
  ]) numpadKeys);
in
{
  wayland.windowManager.mango.settings = {
    bind = [
      # --- session ---
      "SUPER,Return,spawn,ghostty"
      "SUPER,Q,killclient"
      "SUPER,R,reload_config"
      "SUPER+SHIFT,E,quit"

      # --- window state ---
      "SUPER,F,togglefullscreen"
      "SUPER,T,togglefloating"
      "SUPER,M,togglemaximizescreen"
      "SUPER,Tab,toggleoverview" # Native mango overview

      # --- focus / movement ---
      "SUPER,Left,focusdir,left"
      "SUPER,Right,focusdir,right"
      "SUPER,Up,focusdir,up"
      "SUPER,Down,focusdir,down"
      "SUPER+SHIFT,Left,exchange_client,left"
      "SUPER+SHIFT,Right,exchange_client,right"
      "SUPER+SHIFT,Up,exchange_client,up"
      "SUPER+SHIFT,Down,exchange_client,down"

      # --- screenshot ---
      "NONE,Print,spawn,dms ipc call screenshot toggle"
      "SUPER,Print,spawn,dms ipc call screenshot region"

      # --- media keys ---
      "NONE,XF86MonBrightnessUp,spawn,brightnessctl s +5%"
      "NONE,XF86MonBrightnessDown,spawn,brightnessctl s 5%-"
      "NONE,XF86AudioRaiseVolume,spawn,wpctl set-volume @DEFAULT_SINK@ 5%+"
      "NONE,XF86AudioLowerVolume,spawn,wpctl set-volume @DEFAULT_SINK@ 5%-"
      "NONE,XF86AudioMute,spawn,wpctl set-mute @DEFAULT_SINK@ toggle"
      "NONE,XF86AudioPlay,spawn,playerctl play-pause"
      "NONE,XF86AudioNext,spawn,playerctl next"
      "NONE,XF86AudioPrev,spawn,playerctl previous"

      # --- DankMaterialShell IPC ---
      "SUPER,Space,spawn,dms ipc call spotlight toggle"             # app launcher
      "SUPER,Escape,spawn,dms ipc call powermenu toggle"            # power menu
      "SUPER,I,spawn,dms ipc call settings open"                    # settings
      "SUPER,N,spawn,dms ipc call notifications toggle"             # notification center
      "SUPER,V,spawn,dms ipc call clipboard toggle"                 # clipboard history
      "SUPER,period,spawn,dms ipc call notepad toggle"              # notepad
      "SUPER+SHIFT,D,spawn,dms ipc call dash toggle"                # dashboard
      "SUPER+SHIFT,Escape,spawn,dms ipc call processlist toggle"    # task manager
      "SUPER+SHIFT,N,spawn,dms ipc call night toggle"               # night mode
      "SUPER,W,spawn,dms ipc call overview toggle"                  # workspace overview
    ] ++ tagBinds ++ numpadBinds;
  };
}