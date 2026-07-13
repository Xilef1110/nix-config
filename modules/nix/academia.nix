{ self, inputs, ... }:
{
  flake.nixosModules.system =
    { pkgs, ... }:
    {

      environment.systemPackages = with pkgs; [
        zotero
        # typst language server
        tinymist
      ];
    };
}
