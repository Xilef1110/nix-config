
{ self, inputs, ... }:
{
  flake.homeModules.packages =
    { pkgs, lib, ... }:
    {
      services.kdeconnect.enable = true;
      home.packages = with pkgs; [
        zoxide
        resources
        nil
        nixd
        ripgrep
        fd
        bat
        onedrivegui
        git
        libreoffice
        hunspell
        hunspellDicts.en-ca
        hunspellDicts.de-at
        vlc
      ];
      };
    }

