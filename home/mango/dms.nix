{ ... }:
{
  programs.dank-material-shell = {
    enable = true;
    systemd.enable = false;
    restartIfChanged = true;
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}
