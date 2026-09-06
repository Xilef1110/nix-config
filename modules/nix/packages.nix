{ self, inputs, ... }:
{
  flake.nixosModules.packages =
    { pkgs, lib, ... }:
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
      ];
      programs.kdeconnect.enable = true;
    };
}
