{ self, inputs, ... }:
{
  flake.nixosModules.downloadManagement =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        qbittorrent
      ];
    };
}
