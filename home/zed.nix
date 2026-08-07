{ pkgs, ... }: {
  programs.zed-editor = {
    enable = true;

    # Automatically install Zed extensions
    extensions = [
      "nix"
      "toml"
      "rust"
    ];

    # Extra LSP servers or binaries provided directly by Nix
    extraPackages = with pkgs; [
      nixd        # Nix Language Server
      alejandra   # Nix Formatter
    ];

    # Your Zed settings (~/.config/zed/settings.json)
    userSettings = {
      theme = "One Dark";
      vim_mode = true;
      ui_font_size = 14;
      buffer_font_size = 14;

      # Configure LSP tools (e.g., Nix formatting)
      lsp = {
        nixd = {
          formatting = {
            command = [ "alejandra" ];
          };
        };
      };

      languages = {
        Nix = {
          language_servers = [ "nixd" ];
          formatter = {
            external = {
              command = "alejandra";
              arguments = [ "-" ];
            };
          };
        };
      };
    };
  };
}
