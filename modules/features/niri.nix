{ self, inputs, ... }:
{
  flake.nixosModules.niri =
    { pkgs, lib, ... }:
    {
      programs.niri = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
      };
    };

  perSystem =
    {
      pkgs,
      lib,
      self',
      ...
    }:
    {
      packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
        inherit pkgs; # THIS PART IS VERY IMPORTAINT, I FORGOT IT IN THE VIDEO!!!
        settings = {
          spawn-at-startup = [
            (lib.getExe self'.packages.myNoctalia)
            (lib.getExe pkgs.thunderbird)
            (lib.getExe pkgs.fuzzel)
          ];

          xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

          input.keyboard.xkb.layout = "us,ua";

          layout.gaps = 5;

          # output.scale = 1.0;

          # touchpad.natural-scroll = { };

          binds = {
            "Mod+Return".spawn-sh = lib.getExe self'.packages.myKitty;
            "Mod+Q".close-window = _: { };
            "Mod+S".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";
            "Mod+Space".spawn-sh = lib.getExe pkgs.fuzzel;
            "Mod+A".spawn-sh = lib.getExe self'.packages.myHelix;

            # Workspace Navigation
            "Ctrl+Alt+Right".focus-workspace-down = _: { };
            "Ctrl+Alt+Left".focus-workspace-up = _: { };

            # Window Managment
            "Mod+Ctrl+Left".consume-or-expel-window-left = _: { };
            "Mod+Ctrl+Right".consume-or-expel-window-right = _: { };
            "Ctrl+Comma".consume-window-into-column = _: { };
            "Ctrl+Period".expel-window-from-column = _: { };

            "Mod+F".maximize-column = _: { };
            "Mod+G".fullscreen-window = _: { };
            "Mod+Shift+F".toggle-window-floating = _: { };
            "Mod+C".center-column = _: { };

            # Window Navigation
            "Mod+O".toggle-overview = _: { };

            "Mod+H".focus-column-left = _: { };
            "Mod+L".focus-column-right = _: { };
            "Mod+K".focus-window-up = _: { };
            "Mod+J".focus-window-down = _: { };

            "Mod+Left".focus-column-left = _: { };
            "Mod+Right".focus-column-right = _: { };
            "Mod+Up".focus-window-up = _: { };
            "Mod+Down".focus-window-down = _: { };

            "Mod+Shift+H".move-column-left = _: { };
            "Mod+Shift+L".move-column-right = _: { };
            "Mod+Shift+K".move-window-up = _: { };
            "Mod+Shift+J".move-window-down = _: { };

          };
        };
      };
    };
}
