{ self, inputs, ... }:
{

  flake.homeModules.zed =
    { pkgs, lib, ... }:
    {

      programs.zed-editor = {
        # test
        enable = true;
        extensions = [
          "nix"
          "toml"
          "rust"
          "catppuccin"
        ];
        userSettings = {
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
          inlay_hints.enabled = true;
          lsp = {

            rust-analyzer = {
              binary = {
                # path = lib.getExe pkgs.rust-analyzer;
                path_lookup = true;
              };
            };
            nix = {
              binary = {
                path_lookup = true;
              };
            };
            ty = {
              binary = {
                path_lookup = true;
              };
            };
            ruff = {
              binary = {
                path_lookup = true;
              };
            };
            jedi = {
              binary = {
                path_lookup = true;
              };
            };
          };
          languages = {
            "Python" = {
              language_servers = [
                "!basedpyright"
                "ty"
                "ruff"
                "jedi"
              ];
            };

          };
        };

        userKeymaps = [
          {
            context = "Editor && vim_mode == insert";
            bindings = {
              alt-i = "vim::NormalBefore";
            };
          }
          {
            context = "(Editor && vim_mode == normal) || !menu";
            bindings = {
              "Ctrl-s" = "workspace::Save";
            };

          }
        ];
      };
    };

}
