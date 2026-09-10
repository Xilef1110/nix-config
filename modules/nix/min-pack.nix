{ self, ... }: {
  flake.nixosModules.minimalPackages =
    { pkgs, ... }:
    {
      imports = [
        self.nixosModules.system
      ];
      environment.systemPackages = with pkgs; [
        onedrivegui
        git
        libreoffice
        hunspell
        hunspellDicts.en-ca
        hunspellDicts.de-at
        vlc
        mullvad-browser
        efibootmgr
      ];
      programs.kdeconnect.enable = true;
    };
}
