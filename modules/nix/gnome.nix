{ self, ... }:
{
  flake.nixosModules.gnomePackages =
    { pkgs, ... }:
    {
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
        gnomeExtensions.appindicator
        gnome-tweaks
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
    };
}
