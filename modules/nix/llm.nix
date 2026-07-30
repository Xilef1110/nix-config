{ self, inputs, ... }:
{
  flake.nixosModules.llm =
    { pkgs, ... }:
    {

      environment.systemPackages = with pkgs; [
        opencode
      ];

      services.ollama = {
        enable = true;
        package = pkgs.ollama-rocm;
        loadModels = [ "phi4-mini:3.8b" ];
      };
    };
}
