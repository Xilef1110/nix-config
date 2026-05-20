{ self, inputs, ... }:
{

  flake.homeModules.dellNiriHomeModule =
    { pkgs, lib, ... }:
    {

      home.packages = [ pkgs.hello ];
      programs.helix = {
        enable = true;
        settings = {
          keys = {
            normal = {
              "C-s" = ":w";
            };
            insert = {
              "A-i" = "normal_mode";
            };
          };
          editor = {
            soft-wrap.enable = true;
            line-number = "relative";
          };
        };
        languages.language = [
          {
            name = "nix";
            auto-format = true;
            # formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
          }
        ];
      };

    };
}
