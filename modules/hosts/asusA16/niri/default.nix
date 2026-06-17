{ self, inputs, ... }:
{
  flake.nixosConfigurations.asusNiri = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.asusNiriConfiguration
    ];
  };
}
