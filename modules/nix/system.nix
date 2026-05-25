{ self, inputs, ... }:
{
  flake.nixosModules.communication =
    { pkgs, ... }:
    {

      environment.systemPackages = with pkgs; [
        resources
        wl-clipboard
      ];
    };
}
