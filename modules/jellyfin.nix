{ lib, ... }:
{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };

  systemd.services.jellyfin.wantedBy = lib.mkForce [ ];

  # optional:
  hardware.graphics.enable = true;
  users.users.jellyfin.extraGroups = [ "video" "render" ];
}
