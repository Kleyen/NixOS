{...}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "auto";
        padding = {
          top = 2;
        };
      };
      display = {
        separator = " ";
      };
      modules = [
        {type = "break";}
        {type = "break";}
        {
          type = "title";
          keyWidth = "8";
        }
        {type = "break";}
        {
          type = "custom";
          format = "{#90}  {#31}  {#32}  {#33}  {#34}  {#35}  {#36}  {#37} ";
        }
        {type = "break";}
        {
          type = "os";
          key = " os";
          keyColor = "34";
        }
        {type = "break";}
        {
          type = "kernel";
          key = " kernel";
          keyColor = "34";
        }
        {type = "break";}
        {
          type = "packages";
          key = "󰏗 packages";
          keyColor = "34";
        }
        {type = "break";}
        {
          type = "shell";
          key = " shell";
          keyColor = "34";
        }
        {type = "break";}
        {
          type = "terminal";
          key = " terminal";
          keyColor = "34";
        }
        {type = "break";}
        {
          type = "wm";
          key = " wm";
          keyColor = "34";
        }
        {type = "break";}
        {
          type = "display";
          key = "󰨇 display";
          keyColor = "34";
        }
        {type = "break";}
        {
          type = "cpu";
          format = "{1}";
          key = "󰻠 cpu";
          keyColor = "34";
        }
        {type = "break";}
        {
          type = "memory";
          key = "  mem";
          keyColor = "34";
        }
        {type = "break";}
        {
          type = "swap";
          key = "󰾷 swap";
          keyColor = "34";
        }
        {type = "break";}
        {
          type = "disk";
          key = " disk";
          keyColor = "34";
        }
        {type = "break";}
        {
          type = "uptime";
          key = "󱫡 uptime";
          keyColor = "34";
        }
        {type = "break";}
        {
          type = "command";
          key = "󱦟 os-age";
          keyColor = "34";
          text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
        }
        {type = "break";}
        {
          type = "custom";
          format = "{#90}  {#31}  {#32}  {#33}  {#34}  {#35}  {#36}  {#37} ";
        }
        {type = "break";}
        {type = "break";}
      ];
    };
  };
}