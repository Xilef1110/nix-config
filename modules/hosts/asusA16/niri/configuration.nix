{ self, inputs, ... }:
{
  flake.nixosModules.asusNiriConfiguration =
    { config, pkgs, ... }:

    {
      imports = [
        # Include the results of the hardware scan.
        self.nixosModules.niri
        self.nixosModules.asusShared
      ];

      # Enable CUPS to print documents.
      services.printing.enable = true;

      services.openssh = {
        enable = true;
      };

      services.xserver.displayManager.lightdm.greeters.gtk = {
        enable = true;
        #Icon Theme
        iconTheme = {
          package = pkgs.adwaita-icon-theme;
          name = "Adwaita";
          # package = pkgs.kdePackages.breeze-icons;
          # name = "Breeze-Dark";
        };
      };

      # List services that you want to enable:
      hardware.bluetooth.enable = true;
      networking.wireless.enable = true;
      services.power-profiles-daemon.enable = true;
      services.upower.enable = true;

    };
}
