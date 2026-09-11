{ self, inputs, ... }:
{
  flake.nixosConfigurations.narset = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.narsetConfiguration
    ];
  };
}
