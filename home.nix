{ ... }:
{
  imports = [
    ./home/zsh.nix
    ./home/foot.nix
    ./home/ghostty.nix
    ./home/fastfetch.nix
    ./home/packages.nix
    ./home/programs.nix
    ./home/qutebrowser.nix
    ./home/theming.nix
    ./home/mango
    ./home/dms.nix
    ./home/zed.nix
  ];

  home.username = "denver";
  home.homeDirectory = "/home/denver";
  programs.home-manager.enable = true;
  home.stateVersion = "26.05";
}
