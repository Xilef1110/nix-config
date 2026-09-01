{ self, inputs, ... }:
{
  flake.nixosModules.packages =
    { pkgs, lib, ... }:
    {
      environment.systemPackages = with pkgs; [
        onedrivegui
        git
        _1password-gui
        onlyoffice
        libreoffice
        hunspell
        hunspellDicts.en-ca
        hunspellDicts.de-at
        obsidian
        josm
        vlc
        gthumb
        xmage
        mullvad-browser
        itch
      ];
      programs.kdeconnect.enable = true;
    };
}
