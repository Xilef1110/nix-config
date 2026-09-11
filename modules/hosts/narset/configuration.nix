{ self, inputs, ... }:
{
  flake.nixosModules.narsetConfiguration =
    { config, pkgs, ... }:

    {
      imports = [
        # Include the results of the hardware scan.
        self.nixosModules.myHomeManager
        self.nixosModules.minimalPackages
        self.nixosModules.communication
        self.nixosModules.dev
      ];

      home-manager.users.felix = self.homeModules.narsetHomeModule;

      # Before changing this value read the documentation for this option
      # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
      system.stateVersion = "26.05"; # Did you read the comment?

    };
}
