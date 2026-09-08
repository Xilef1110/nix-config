{ self, inputs, ... }:
{
  flake.nixosModules.cisco =
    { pkgs, ... }:
    {

      services.anyconnect-webauth = {
        enable = true;
        connections = {
          work = {
            gateway = "vpn.company.com";
            connectionName = "Work VPN"; # optional, defaults to the attribute name
          };
        };
      };
    };
}
