{ self, inputs, ... }:
{

  # This is your standalone home-manager configuration, meant to be used on non-nixos machines
  # with the home-manager command
  flake.homeConfigurations.felix = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    modules = [
      self.homeModules.dellNiriHomeModule
      {
        home.username = "felix";
        home.homeDirectory = "/home/felix";
      }

    ];
  };

  # This is your home.nix, your module where you configure home-manager
  # It's imported both in standalone configuration above, and in your nixos configuration
  flake.homeModules.dellNiriHomeModule =
    { pkgs, lib, ... }:
    {
      imports = [
        self.homeModules.Zed
        self.homeModules.helix
        self.homeModules.firefox
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
