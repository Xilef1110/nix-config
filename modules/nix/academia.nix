{ self, inputs, ... }:
{
  flake.nixosModules.academia =
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
