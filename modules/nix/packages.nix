{ self, ... }:
{
  flake.nixosModules.packages =
    { pkgs, ... }:
    {
      imports = [
        self.nixosModules.minimalPackages
      ];
      environment.systemPackages = with pkgs; [
        _1password-gui
        onlyoffice-desktopeditors
        obsidian
        josm
        gthumb
        xmage
        itch
        mediawriter
        unetbootin
      ];
      programs.kdeconnect.enable = true;
    };
}
