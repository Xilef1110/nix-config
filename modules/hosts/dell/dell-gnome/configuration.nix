{ self, ... }:
{
  flake.nixosModules.dellGnomeConfiguration =
    { pkgs, ... }:
    {
      imports = [
        self.nixosModules.dellShared
        self.nixosModules.gnomePackages
      ];

      home-manager.users.felix = self.homeModules.dellGnomeHomeModule;

      #Enable Gnome Desktop Environment
      services.displayManager.gdm.enable = true;
      services.desktopManager.gnome.enable = true;

    };
}
