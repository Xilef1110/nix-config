{ self, inputs, ... }:

{
  flake.nixosConfigurations.dellGnome = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.dellGnomeConfiguration
    ];
  };
}
