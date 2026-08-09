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
    gappoh = 4; # horizontal outer gap (window to screen edge)
    gappov = 5; # vertical outer gap
    focuscolor = "0xc9b890ff";

    # --- Noctalia layer-surface blur & shadows (bars, panels, dock) ---
    # Distinct from `blur` above, which only covers regular app windows —
    # these target layer-shell surfaces specifically. Verify against
    # `home-manager option wayland.windowManager.mango.settings` before
    # rebuilding: inferred from the flat-key pattern this file already
    # uses (like borderpx/gappih), not confirmed against the mango
    # module source itself.
    blur_layer = 1;
    shadows = 1;
    layer_shadows = 1;
    shadow_only_floating = 1;
    shadows_size = 12;
    shadows_blur = 15;
    shadowscolor = "0x000000ff";
  };
}
