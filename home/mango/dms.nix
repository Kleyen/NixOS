{ inputs, ... }:
{
  imports = [ inputs.dms.homeModules.dank-material-shell ];

  programs.dank-material-shell = {
    enable = true;
    systemd.enable = false;

    enableDynamicTheming = true;
    enableSystemMonitoring = true;
  };
}
