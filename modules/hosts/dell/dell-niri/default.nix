{ self, inputs, ... }:
{
  flake.nixosConfigurations.dellNiri = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.dellNiriConfiguration
    ];
  };
}
