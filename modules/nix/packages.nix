{ self, inputs, ... }:
{
  flake.nixosModules.packages =
    { pkgs, lib, ... }:
    {
      environment.systemPackages = with pkgs; [
        onedrivegui
        git
        _1password-gui
        nil
        nixd
        libreoffice
        hunspell
        hunspellDicts.en-ca
        hunspellDicts.de-at
        nautilus
        obsidian
        kdePackages.kdeconnect-kde
        josm
        vlc
        loupe
        gthumb
        xmage
        mullvad-browser
      ];
      programs.kdeconnect.enable = true;
    };
}
