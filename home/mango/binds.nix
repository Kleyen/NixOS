{ lib, ... }:
let
  tagBinds = lib.flatten (map (n: [
    "CTRL,${toString n},view,${toString n}"
    "ALT,${toString n},tag,${toString n}"
  ]) (lib.range 1 9));

  numpadKeys = [
    "KP_End" "KP_Down" "KP_Next" "KP_Left" "KP_Begin"
    "KP_Right" "KP_Home" "KP_Up" "KP_Prior"
  ];

  numpadBinds = lib.flatten (lib.imap1 (i: key: [
    "CTRL,${key},view,${toString i}"
    "ALT,${key},tag,${toString i}"
  ]) numpadKeys);
in
{
  wayland.windowManager.mango.settings = {
    bind = [
      "SUPER,Return,spawn,ghostty"
      "SUPER,Q,killclient"
      "SUPER,R,reload_config"
      "SUPER+SHIFT,E,quit"
      "CTRL+ALT,n,switch_layout"

      "SUPER,F,togglefullscreen"
      "SUPER,T,togglefloating"
      "SUPER,M,togglemaximizescreen"
      "SUPER,Tab,toggleoverview"

      "SUPER,Left,focusdir,left"
      "SUPER,Right,focusdir,right"
      "SUPER,Up,focusdir,up"
      "SUPER,Down,focusdir,down"
      "SUPER+SHIFT,Left,exchange_client,left"
      "SUPER+SHIFT,Right,exchange_client,right"
      "SUPER+SHIFT,Up,exchange_client,up"
      "SUPER+SHIFT,Down,exchange_client,down"

      "NONE,Print,spawn,noctalia msg screenshot-region"
      "SUPER,Print,spawn,noctalia msg screenshot-fullscreen"

      "NONE,XF86MonBrightnessUp,spawn,noctalia msg brightness-up"
      "NONE,XF86MonBrightnessDown,spawn,noctalia msg brightness-down"
      "NONE,XF86AudioRaiseVolume,spawn,noctalia msg volume-up"
      "NONE,XF86AudioLowerVolume,spawn,noctalia msg volume-down"
      "NONE,XF86AudioMute,spawn,noctalia msg volume-mute"
      "NONE,XF86AudioPlay,spawn,noctalia msg media toggle"
      "NONE,XF86AudioNext,spawn,noctalia msg media next"
      "NONE,XF86AudioPrev,spawn,noctalia msg media previous"

      "SUPER,Space,spawn,noctalia msg panel-toggle launcher"
      "SUPER,Escape,spawn,noctalia msg panel-toggle session"
      "SUPER,I,spawn,noctalia msg settings-toggle"
      "SUPER,S,spawn,noctalia msg panel-toggle control-center"
      "SUPER,V,spawn,noctalia msg panel-toggle clipboard"
      "SUPER,W,spawn,noctalia msg panel-toggle wallpaper"
      "SUPER,N,spawn,noctalia msg notification-dnd-toggle"
      "SUPER+SHIFT,N,spawn,noctalia msg nightlight-toggle"
      "SUPER+SHIFT,Escape,spawn,noctalia msg window-switcher"
      "SUPER,L,spawn,noctalia msg session lock"
    ] ++ tagBinds ++ numpadBinds;
  };
}
