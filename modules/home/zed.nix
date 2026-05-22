{ self, inputs, ... }:
{

  flake.homeModules.Zed =
    { pkgs, lib, ... }:
    {

      programs.zed-editor = {
        # test
        userSettings = {
          enable = true;
          extensions = [
            "nix"
            "toml"
            "rust"
            "catppuccin"
          ];
          theme = {
            mode = "dark";
            light = "Gruvbox Light";
            dark = "Catppuccin Frappé";
          };
          helix_mode = true;
          disable_ai = true;
          relative_line_numbers = "enabled";

          project_panel.dock = "left";
          outline_panel.dock = "left";
          collaboration_panel.dock = "left";
          git_panel.dock = "left";
        };

        userKeymaps = [
          {
            context = "Editor && vim_mode == insert";
            bindings = {
              alt-i = "vim::NormalBefore";
            };
          }
          {
            context = "Editor && vim_mode == insert";
            bindings = {
              "alt-i" = "vim::NormalBefore";
            };

          }
        ];
      };
    };

}
