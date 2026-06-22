{ self, inputs, ... }:
{
  flake.homeModules.gnome =
    { pkgs, lib, ... }:
    {
      dconf = {
        enable = true;

        "org/gnome/desktop/background" = {
          picture-uri = "file:///home/felix/nixos/modules/features/wallpapers/eshkiDragonclaw.jpg";
          picture-uri-dark = "file:///home/felix/nixos/modules/features/wallpapers/eshkiDragonclaw.jpg";
        };
      };
    };
}
