{ self, inputs, ... }:
{

  flake.homeModules.Zed =
    { pkgs, lib, ... }:
    {

      programs.zed-editor = {
        enable = true;
        extensions = [
          "nix"
          "toml"
          "rust"
        ];
        userSettings = {
          theme = {
            mode = "system";
            dark = "One Dark";
            light = "One Light";
          };
          hour_format = "hour24";
          helix_mode = true;
          assistant.enabled = false;
        };
      };
    };
}
