{ self, inputs, ... }:
{
  flake.homeModules.asusHomeModule =
    { pkgs, lib, ... }:
    {
      imports = [
        self.homeModules.helix
        self.homeModules.firefox
        self.homeModules.ghostty
        self.homeModules.zed
      ];
      programs.bash.enable = true;
      programs.bash.shellAliases.ll = "ls -l";

      home.packages = [ pkgs.hello ];

      programs.onedrive = {
        enable = true;
        package = pkgs.onedrive;
      };

      programs.zoxide.enable = true;

      home.stateVersion = "26.05";
    };
}
