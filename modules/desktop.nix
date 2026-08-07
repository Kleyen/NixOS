{ inputs, ... }: {
  imports = [
    inputs.mangowm.nixosModules.mango
    #inputs.noctalia.nixosModules.default
  ];
  programs.mango.enable = true;
  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
  };
}
