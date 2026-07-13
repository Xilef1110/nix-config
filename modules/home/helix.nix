{ self, inputs, ... }:
{
  flake.homeModules.helix =
    { pkgs, lib, ... }:
    {

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
        languages.language-server.tinymist = {
          command = "tinymist";
          config = {
            exportPdf = "onSave";
            preview.background.enabled = true;
            preview.background.args = [
              "--data-plane-host=127.0.0.1:0"
              "--invert-colors=never"
              "--open"
            ];
          };
        };
      };
    };
}
