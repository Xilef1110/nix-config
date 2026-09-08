{ self, inputs, ... }:
{
  flake.nixosModules.cisco =
    { pkgs, ... }:
    {
      imports = [
        inputs.anyconnect-webauth.nixosModules.default
      ];

      services.anyconnect-webauth = {
        enable = true;
        connections = {
          work = {
            gateway = "myvpn.ubc.ca";
            connectionName = "Work VPN"; # optional, defaults to the attribute name
          };
        };
      };
    };
}
