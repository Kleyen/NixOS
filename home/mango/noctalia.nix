{ ... }:
{
  # Full config reference: https://docs.noctalia.dev/v5/configuration/
  # Anything you'd otherwise hand-write in ~/.config/noctalia/*.toml goes
  # under `settings` below — TOML [section.key] maps to nested Nix
  # attrsets (e.g. [bar.main] -> bar.main = { ... };).
  programs.noctalia = {
    enable = true;
    settings = {
      bar.main = {
        shadow = false;
        contact_shadow = false;
      };
      dock.shadow = false;
      shell.panel.shadow = false;
    };
  };
}
