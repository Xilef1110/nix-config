{ self, inputs, ... }:
{
  flake.nixosModules.communication =
    { pkgs, ... }:
    {

      environment.systemPackages = with pkgs; [

        signal-desktop
        thunderbird
        discord
      ];
    };
}
