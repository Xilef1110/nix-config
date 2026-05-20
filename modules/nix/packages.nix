{ self, inputs, ... }:
{
  flake.nixosModules.packages =
    { pkgs, lib, ... }:
    {
      environment.systemPackages = with pkgs; [
        signal-desktop
        onedrivegui
        thunderbird
        wl-clipboard
        git
        _1password-gui
        nil
        libreoffice
        hunspell
        hunspellDicts.en-ca
        hunspellDicts.de-at
        nautilus
        obsidian
        discord
        kdePackages.kdeconnect-kde
        josm
        vlc
        loupe
        gthumb
        xmage
        librewolf
      ];
      programs.kdeconnect.enable = true;
    };
}
