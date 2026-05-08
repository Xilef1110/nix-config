{ self, inputs, ... }:
{

  # This is your standalone home-manager configuration, meant to be used on non-nixos machines
  # with the home-manager command
  flake.homeConfigurations.felix = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    modules = [
      self.homeModules.felixModule
      {
        home.username = "felix";
        home.homeDirectory = "/home/felix";
      }
    ];
  };

  # This is your home.nix, your module where you configure home-manager
  # It's imported both in standalone configuration above, and in your nixos configuration
  flake.homeModules.dellNiriModule =
    { pkgs, lib, ... }:
    {
      programs.bash.enable = true;
      programs.bash.shellAliases.ll = "ls -l";

      home.packages = [ pkgs.hello ];
      programs.helix = {
        enable = true;
        settings = {
          keys = {
            normal = {
              "C-s" = ":w";
            };
            insert = {
              "A-i" = "normal_mode";
            };
          };
          editor.soft-wrap.enable = true;
        };
        languages.language = [
          {
            name = "nix";
            auto-format = true;
            # formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
          }
        ];
      };

      programs.onedrive = {
        enable = true;
        package = pkgs.onedrive;
      };
      home.stateVersion = "24.11";
    };

}
