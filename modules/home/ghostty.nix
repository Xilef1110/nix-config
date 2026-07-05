{ self, inputs, ... }:
{
  flake.homeModules.ghostty =
    { pkgs, lib, ... }:
    {

      programs.ghostty = {
        enable = true;
        settings = {
          theme = "Adwaita Dark"; # Nordfox, Catpuccin Mocha
          background-opacity = "0.95";
          background-blur = "16";
          confirm-close-surface = true;
          keybind = [
            # tabs
            "ctrl+t=new_tab"
            "super+shift+l=next_tab"
            "super+shift+h=previous_tab"
            # splits
            "ctrl+shift+l=new_split:right"
            "ctrl+shift+h=new_split:left"
            "ctrl+shift+j=new_split:down"
            "ctrl+shift+k=new_split:up"
            "ctrl+l=goto_split:right"
            "ctrl+h=goto_split:left"
            "ctrl+j=goto_split:down"
            "ctrl+k=goto_split:up"
            # general
            "ctrl+w=close_surface"
          ];
        };
      };
    };
}
