{ self, inputs, ... }:
{
  flake.homeModules.ghostty =
    { pkgs, lib, ... }:
    {

      programs.ghostty = {
        enable = true;
        settings = {
        };
      };
    };
}
