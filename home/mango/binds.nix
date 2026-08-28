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
      "CTRL+ALT,n,switch_layout"

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

      # --- screenshot (dms screenshot CLI, not IPC — supports Mango natively) ---
      "NONE,Print,spawn,dms screenshot"
      "SUPER,Print,spawn,dms screenshot full"

      # --- media keys ---
      "NONE,XF86MonBrightnessUp,spawn,dms ipc call brightness increment 5"
      "NONE,XF86MonBrightnessDown,spawn,dms ipc call brightness decrement 5"
      "NONE,XF86AudioRaiseVolume,spawn,dms ipc call audio increment 5"
      "NONE,XF86AudioLowerVolume,spawn,dms ipc call audio decrement 5"
      "NONE,XF86AudioMute,spawn,dms ipc call audio mute"
      "NONE,XF86AudioPlay,spawn,dms ipc call mpris playPause"
      "NONE,XF86AudioNext,spawn,dms ipc call mpris next"
      "NONE,XF86AudioPrev,spawn,dms ipc call mpris previous"

      # --- DMS IPC ---
      "SUPER,Space,spawn,dms ipc call spotlight toggle"           # app launcher
      "SUPER,Escape,spawn,dms ipc call powermenu toggle"           # logout/reboot/shutdown menu
      "SUPER,I,spawn,dms ipc call settings toggle"                 # settings
      "SUPER,S,spawn,dms ipc call control-center toggle"           # control center
      "SUPER,V,spawn,dms ipc call clipboard toggle"                # clipboard history
      "SUPER,W,spawn,dms ipc call dash toggle wallpaper"           # wallpaper picker (dash's wallpaper tab)
      "SUPER,N,spawn,dms ipc call notifications toggleDoNotDisturb" # DND toggle
      "SUPER+SHIFT,N,spawn,dms ipc call night toggle"               # night mode
      "SUPER+SHIFT,Escape,spawn,dms ipc call processlist open"      # process/performance list (see note below)
      "SUPER,L,spawn,dms ipc call lock lock"                        # lock screen
    ] ++ tagBinds ++ numpadBinds;
  };
}
