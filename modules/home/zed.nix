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
          # "rust"
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

          # Hints and Preditioncs
          inlay_hints.enabled = true;
          edit_predictions.mode = "eager";
          show_edit_predictions = true;
          inline_code_actions = true;
          lsp_document_colors = "inlay";
          colorize_brackets = true;

          # Language Specific Settings
          lsp = {

            rust-analyzer = {
              binary = {
                # path = lib.getExe pkgs.rust-analyzer;
                # path_lookup = true;
              };
            };
            nil = {
              binary = {
                # path_lookup = true;
              };
            };
            nixd = {
              binary = {
                # path_lookup = true;
              };
            };
            ty = {
              binary = {
                # path_lookup = true;
              };
            };
            ruff = {
              binary = {
                # path_lookup = true;
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
