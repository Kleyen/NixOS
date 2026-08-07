{ ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      update = "cd /etc/nixos && sudo nix flake update && sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      gits = "git status";
      rb = "rebuild";
    };

    initContent = ''
      fastfetch
    '';
  };
}
