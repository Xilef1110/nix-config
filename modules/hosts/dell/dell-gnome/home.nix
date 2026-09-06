{ self }:
{
  flake.homeModules.dellGnomeHomeModule = {
    imports = [
      self.homeModules.dellHomeModule
      self.homeModules.gnome
    ];
  };
}
