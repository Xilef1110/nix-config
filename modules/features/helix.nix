{ self, inputs, ... }:
{
  flake.nixosModules.helix =
    { pkgs, lib, ... }:
    {
      programs.helix = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.myHelix;
      };
    };

  perSystem =
    {
      pkgs,
      lib,
      self',
      ...
    }:
    {
      packages.myHelix = inputs.wrapper-modules.wrappers.helix.wrap {
        inherit pkgs;
        # languages.language = [
        #   {
        #     name = "nix";
        #     auto-format = true;
        #     # formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
        #   }
        # ];
      };
    };
}
