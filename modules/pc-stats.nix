{ ... }:
{
  services.glances = {
    enable = true;
    extraArgs = [ "--webserver" "-B" "0.0.0.0" "--port" "5000" ];
  };
  networking.firewall.allowedTCPPorts = [ 5000 ];
}
