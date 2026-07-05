{ self, inputs, ... }:
{
  flake.homeModules.asusHomeModule =
    { pkgs, lib, ... }:
    {
      imports = [
        self.homeModules.helix
        self.homeModules.firefox
        self.homeModules.ghostty
      ];
      programs.bash.enable = true;
      programs.bash.shellAliases.ll = "ls -l";

      home.packages = [ pkgs.hello ];

      programs.onedrive = {
        enable = true;
        package = pkgs.onedrive;
      };
      home.stateVersion = "26.05";
    };
}
