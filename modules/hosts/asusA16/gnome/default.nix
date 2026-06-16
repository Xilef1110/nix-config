{ self, inputs, ... }:
{
  flake.nixosConfigurations.asusGnome = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.asusGnomeConfiguration
    ];
  };
}
