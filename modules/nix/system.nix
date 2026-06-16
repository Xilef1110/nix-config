{ self, inputs, ... }:
{
  flake.nixosModules.system=
    { pkgs, ... }:
    {

      environment.systemPackages = with pkgs; [
        resources
        wl-clipboard
      ];
    };
}
