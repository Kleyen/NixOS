{ ... }:
{
  # Window effects, animations, borders and gaps.
  # blur stays off by default - it's the heaviest setting on integrated
  # GPUs. Flip it to 1 if your hardware can take it.
  wayland.windowManager.mango.settings = {
    blur = 0;
    blur_optimized = 1;
    blur_params = {
      radius = 5;
      num_passes = 2;
    };

    border_radius = 6;
    focused_opacity = 1.0;
    unfocused_opacity = 1.0;

    animations = 1;
    animation_type_open = "slide";
    animation_type_close = "slide";
    animation_duration_open = 400;
    animation_duration_close = 800;
    animation_curve = {
      open = "0.46,1.0,0.29,1";
      close = "0.08,0.92,0,1";
    };

    borderpx = 1;
    gappih = 5; # horizontal inner gap (between windows)
    gappiv = 5; # vertical inner gap
    gappoh = 5; # horizontal outer gap (window to screen edge)
    gappov = 5; # vertical outer gap
    focuscolor = "0xc9b890ff";
  };
}
