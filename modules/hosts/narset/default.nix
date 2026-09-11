{ self, inputs, ... }:
{
  flake.homeConfigurations.Narset = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    modules = [
      self.nixosModules.narsetConfiguration
      {
        home.username = "felix";
        home.homeDirectory = "/home/felix";
      }
    ];
  };
  flake.nixosConfigurations.narset = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.narsetConfiguration
    ];
  };
}
