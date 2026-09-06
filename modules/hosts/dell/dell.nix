{ self }:
{
  flake.nixosModules.dellShare =
    { pkgs }:
    {
      imports = [
        self.nixosModules.myHomeManager
        self.nixosModules.myMachineHardware
        self.nixosModules.packages
        self.nixosModules.communication
        self.nixosModules.system
        self.nixosModules.academia
        self.nixosModules.dev
      ];
      # Bootloader.
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      networking.hostName = "nixos"; # Define your hostname.
      networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.

      # Enable networking
      networking.networkmanager.enable = true;

      # Set your time zone.
      time.timeZone = "America/Vancouver";

      # Select internationalisation properties.
      i18n.defaultLocale = "en_CA.UTF-8";

      # Enable the X11 windowing system.
      services.xserver.enable = true;

      # Configure keymap in X11
      services.xserver.xkb = {
        layout = "us";
        variant = "";
      };

      # Enable CUPS to print documents.
      services.printing.enable = true;

      # Enable sound with pipewire.
      services.pulseaudio.enable = false;
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        #jack.enable = true;

      };
      services.openssh = {
        enable = true;
      };
      users.users.felix = {
        isNormalUser = true;
        description = "Felix Stock";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
      };

      # Allow unfree packages
      nixpkgs.config.allowUnfree = true;

      # List services that you want to enable:
      hardware.bluetooth.enable = true;
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      services.power-profiles-daemon.enable = true;
      services.upower.enable = true;

      system.stateVersion = "25.11"; # Did you read the comment?
    };

}
