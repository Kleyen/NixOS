let
  esc = builtins.fromJSON ''"\u001b"'';
in
{
  programs.fastfetch = {
    enable = true;
    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      "logo" = {
        "type" = "auto";
        "source" = "NetHydra";
        "padding" = {
          "top" = 5;
          "left" = 3;
          "right" = 5;
        };
      };
      "display" = {
        "separator" = "  ";
        "key" = {
          "width" = 16;
        };
        "percent" = {
          "type" = 9;
        };
        "size" = {
          "binaryPrefix" = "iec";
          "ndigits" = 1;
        };
      };
      "modules" = [
        {
          "type" = "custom";
          "format" = "${esc}[38;5;2m┌─────────────────────────────── System ───────────────────────────────┐";
        }
        {
          "type" = "os";
          "key" = "  ${esc}[38;5;40m  OS";
          "format" = "{pretty-name} {arch}";
        }
        {
          "type" = "kernel";
          "key" = "  ${esc}[38;5;40m  Kernel";
          "format" = "{sysname} {release}";
        }
        {
          "type" = "de";
          "key" = "  ${esc}[38;5;40m󰇄  Desktop";
          "format" = "{pretty-name} {version}";
        }
        {
          "type" = "wm";
          "key" = "  ${esc}[38;5;40m󱂬  WM";
          "format" = "{pretty-name} ({protocol-name})";
        }
        {
          "type" = "terminal";
          "key" = "  ${esc}[38;5;40m  Terminal";
          "format" = "{pretty-name} {version}";
        }
        {
          "type" = "shell";
          "key" = "  ${esc}[38;5;40m  Shell";
          "format" = "{pretty-name} {version}";
        }
        {
          "type" = "packages";
          "key" = "  ${esc}[38;5;40m󰏖  Packages";
          "format" = "{nix-system} (nix-system), {flatpak-all} (flatpak)";
        }
        {
          "type" = "locale";
          "key" = "  ${esc}[38;5;40m󰗊  Locale";
          "format" = "{result}";
        }
        {
          "type" = "custom";
          "format" = "${esc}[38;5;2m└───────────────────────────────────────────────────────────────────────┘";
        }
        {
          "type" = "custom";
          "format" = "${esc}[38;5;3m┌────────────────────────────── Hardware ──────────────────────────────┐";
        }
        {
          "type" = "host";
          "key" = "  ${esc}[38;5;178m󰇅  Host";
          "format" = "{name}";
        }
        {
          "type" = "cpu";
          "key" = "  ${esc}[38;5;178m  CPU";
          "format" = "{name}";
        }
        {
          "type" = "gpu";
          "key" = "  ${esc}[38;5;178m󰢮  GPU";
          "format" = "{name} ({type})";
        }
        {
          "type" = "display";
          "key" = "  ${esc}[38;5;178m󰍹  Display";
          "format" = "{width}x{height} @ {refresh-rate}Hz";
        }
        {
          "type" = "memory";
          "key" = "  ${esc}[38;5;178m󰍛  Memory";
          "format" = "{used} / {total} ({percentage})";
        }
        {
          "type" = "swap";
          "key" = "  ${esc}[38;5;178m󰓡  Swap";
          "format" = "{used} / {total} ({percentage}) - zram";
        }
        {
          "type" = "disk";
          "key" = "  ${esc}[38;5;178m󰋊  Disk";
          "format" = "{size-used} / {size-total} ({size-percentage}) - {filesystem} [{mountpoint}]";
          "folders" = "/:/mnt/Data";
        }
        {
          "type" = "custom";
          "format" = "${esc}[38;5;3m└───────────────────────────────────────────────────────────────────────┘";
        }
        {
          "type" = "custom";
          "format" = "${esc}[38;5;1m┌─────────────────────────────── Status ────────────────────────────────┐";
        }
        {
          "type" = "localip";
          "key" = "  ${esc}[38;5;167m󰩠  Local IP";
          "format" = "{ipv4} ({ifname})";
          "showIpv6" = false;
          "showPrefixLen" = false;
        }
        {
          "type" = "datetime";
          "key" = "  ${esc}[38;5;167m󰔠  Date";
          "format" = "{day-in-month}.{month-pretty}.{year}  {hour-pretty}:{minute-pretty}:{second-pretty}";
        }
        {
          "type" = "processes";
          "key" = "  ${esc}[38;5;167m  Processes";
          "format" = "{result} running";
        }
        {
          "type" = "command";
          "key" = "  ${esc}[38;5;167m󱫘  Installed";
          "text" = "LC_ALL=C date -d \"@$(stat -c %W /)\" \"+%d.%m.%Y %H:%M\" 2>/dev/null || echo N/A";
        }
        {
          "type" = "command";
          "key" = "  ${esc}[38;5;167m󱤦  OS Age";
          "text" = "echo \"$(( ($(date +%s) - $(stat -c %W /)) / 86400 )) days since install\"";
        }
        {
          "type" = "uptime";
          "key" = "  ${esc}[38;5;167m󱫡  Uptime";
          "format" = "{days}d {hours}h {minutes}m";
        }
        {
          "type" = "custom";
          "format" = "${esc}[38;5;1m└───────────────────────────────────────────────────────────────────────┘";
        }
      ];
    };
  };
}
