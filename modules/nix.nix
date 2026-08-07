{...}: {
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    auto-optimise-store = true;
    # No substituter here on purpose — the old noctalia.cachix.org entry was a
    # leftover from evaluating Noctalia (dropped before this repo settled on
    # DMS, then caelestia-shell). caelestia-shell doesn't have a public cachix
    # cache as of this writing, so builds come from nixpkgs binaries plus
    # whatever caelestia-shell needs to build locally.
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
