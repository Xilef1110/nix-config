{ self, inputs, ... }:
{
  flake.nixosModules.asusGnomeConfiguration =
    { config, pkgs, ... }:

    {
      imports = [
        # Include the results of the hardware scan.
        self.nixosModules.asusShared
      ];

      home-manager.users.felix = self.homeModules.asusGnomeHomeModule;
      # Enable the GNOME Desktop Environment.
      services.displayManager.gdm.enable = true;
      services.desktopManager.gnome.enable = true;

      # List packages installed in system profile. To search, run:
      # $ nix search wget
      environment.systemPackages = with pkgs; [
        helix
        git
        wl-clipboard
        gnome-extension-manager
        gnomeExtensions.gsconnect
        gnomeExtensions.simpleweather
        gnomeExtensions.places-status-indicator
        gnomeExtensions.vitals
        gnomeExtensions.extension-list
      ];
      environment.gnome.excludePackages = with pkgs; [
        atomix # puzzle game
        cheese # webcam tool
        epiphany # web browser
        evince # document viewer
        geary # email reader
        gedit # text editor
        gnome-music
        gnome-tour
        hitori # sudoku game
        iagno # go game
        tali # poker game
        totem # video player
      ];
      # Before changing this value read the documentation for this option
      # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
      system.stateVersion = "26.05"; # Did you read the comment?

    };
}
