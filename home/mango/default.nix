{ inputs, ... }:
{
  imports = [
    inputs.mangowm.hmModules.mango
    ./appearance.nix
    ./input.nix
    ./binds.nix
    ./rules.nix
    ./autostart.nix
    ./dms.nix
  ];

  wayland.windowManager.mango.enable = true;
}
