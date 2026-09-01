{ self, inputs, ... }:
{
  flake.nixosModules.system =
    { pkgs, ... }:
    {

      programs.zoxide.enableBashIntegration = true;
      environment.systemPackages = with pkgs; [
        resources
        wl-clipboard
        nautilus
        kdePackages.kdeconnect-kde
        loupe
        nil
        nixd
        ripgrep
        fd
        bat
        zoxide
      ];
    };
}
