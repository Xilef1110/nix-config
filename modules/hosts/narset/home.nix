{ self, ... }:
{
  flake.homeModules.narsetHomeModule =
    { pkgs, ... }:
    {
      imports = [
        self.homeModules.helix
        self.homeModules.firefox
        self.homeModules.ghostty
      ];
      programs.bash.enable = true;

      programs.onedrive = {
        enable = true;
        package = pkgs.onedrive;
      };

      programs.zoxide.enable = true;

      home.stateVersion = "25.05";
    };
}
