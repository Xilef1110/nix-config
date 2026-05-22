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
            mode = "dark";
            light = "Gruvbox Light";
            dark = "Catppuccin Frappe";
          };
          helix_mode = true;
          disable_ai = true;
          relative_line_number = "enabled";

          project_panel.dock = "left";
          outline_panel.dock = "left";
          collaboration_panel.dock = "left";
          git_panel.dock = "left";

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
    };
}
