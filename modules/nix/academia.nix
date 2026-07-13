{ self, inputs, ... }:
{
  flake.nixosModules.system =
    { pkgs, ... }:
    {

      environment.systemPackages = with pkgs; [
        zotero
        # typst
        typst
        tinymist
      ];
    };
}
