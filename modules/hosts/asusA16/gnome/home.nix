{ self, inputs, ... }:
{
  flake.homeModules.asusGnomeHomeModule =
    { pkgs, lib, ... }:
    {
      imports = [
        self.homeModules.asusHomeModule
        self.homeModules.gnome
      ];
    };
}
