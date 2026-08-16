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

      # --- screenshot (Noctalia's own capture, not a compositor tool) ---
      "NONE,Print,spawn,noctalia msg screenshot-region"
      "SUPER,Print,spawn,noctalia msg screenshot-fullscreen"

      # --- media keys ---
      "NONE,XF86MonBrightnessUp,spawn,noctalia msg brightness-up"
      "NONE,XF86MonBrightnessDown,spawn,noctalia msg brightness-down"
      "NONE,XF86AudioRaiseVolume,spawn,noctalia msg volume-up"
      "NONE,XF86AudioLowerVolume,spawn,noctalia msg volume-down"
      "NONE,XF86AudioMute,spawn,noctalia msg volume-mute"
      "NONE,XF86AudioPlay,spawn,noctalia msg media toggle"
      "NONE,XF86AudioNext,spawn,noctalia msg media next"
      "NONE,XF86AudioPrev,spawn,noctalia msg media previous"

      # --- Noctalia IPC ---
      "SUPER,Space,spawn,noctalia msg panel-toggle launcher"        # app launcher (was spotlight)
      "SUPER,Escape,spawn,noctalia msg panel-toggle session"        # logout/reboot/shutdown menu (was powermenu)
      "SUPER,I,spawn,noctalia msg settings-toggle"                  # settings
      "SUPER,S,spawn,noctalia msg panel-toggle control-center"      # control center (was Shift+D "dash" — closest equivalent)
      "SUPER,V,spawn,noctalia msg panel-toggle clipboard"           # clipboard history
      "SUPER,W,spawn,noctalia msg panel-toggle wallpaper"           # wallpaper picker (new — native to Noctalia)
      "SUPER,N,spawn,noctalia msg notification-dnd-toggle"          # DND toggle — mutes toasts, not a history panel like DMS had
      "SUPER+SHIFT,N,spawn,noctalia msg nightlight-toggle"          # night mode (exact match)
      "SUPER+SHIFT,Escape,spawn,noctalia msg window-switcher"       # alt-tab style overview (was processlist — Noctalia has no task manager panel)
      "SUPER,L,spawn,noctalia msg session lock"                     # lock screen (new)
    ] ++ tagBinds ++ numpadBinds;
  };
}
