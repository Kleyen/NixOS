{ inputs, ... }:
{
  imports = [ inputs.mangowm.nixosModules.mango ];

  programs.mango = {
    enable = true;
    addLoginEntry = true; # adds "mango" as a selectable session in SDDM
  };
}
