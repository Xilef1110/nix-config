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
        marksman
        mpls
        tinymist
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
        typst
        devenv
        burpsuite
        guix

      ];
    };
}
