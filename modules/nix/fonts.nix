{ self, inputs, ... }:
{
  flake.nixosModules.fonts =
    { pkgs, ... }:
    {
      fonts.packages = with pkgs; [
        corefonts
        noto-fonts
      ];
    };
}
