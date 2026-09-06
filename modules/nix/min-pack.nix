{
  flake.nixosModules.minimalPackages =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        onedrivegui
        git
        libreoffice
        hunspell
        hunspellDicts.en-ca
        hunspellDicts.de-at
        vlc
        mullvad-browser
      ];
      programs.kdeconnect.enable = true;
    };
}
