{ self, inputs, ... }:
{
  flake.nixosModules.asusShared =
    { config, pkgs, ... }:
    {

      imports = [
        # Include the results of the hardware scan.
        self.nixosModules.myHomeManager
        self.nixosModules.asusHardware
        self.nixosModules.packages
        self.nixosModules.communication
        self.nixosModules.system
        self.nixosModules.downloadManagement
      ];
      # Bootloader.
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      # Use latest kernel.
      # boot.kernelPackages = pkgs.linuxPackages_latest;
      #

      services.libinput.enable = true;

      networking.hostName = "nixos"; # Define your hostname.
      # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

      # Enable networking
      networking.networkmanager.enable = true;

      # Set your time zone.
      time.timeZone = "America/Vancouver";

      # Select internationalisation properties.
      i18n.defaultLocale = "en_CA.UTF-8";

      i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_CA.UTF-8";
        LC_IDENTIFICATION = "en_CA.UTF-8";
        LC_MEASUREMENT = "en_CA.UTF-8";
        LC_MONETARY = "en_CA.UTF-8";
        LC_NAME = "en_CA.UTF-8";
        LC_NUMERIC = "en_CA.UTF-8";
        LC_PAPER = "en_CA.UTF-8";
        LC_TELEPHONE = "en_CA.UTF-8";
        LC_TIME = "en_CA.UTF-8";
      };

      # Enable touchpad support (enabled default in most desktopManager).
      services.asusd = {
        enable = true;
      };

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      # home-manager.users.felix = self.homeModules.asusHomeModule;

      # Allow unfree packages
      nixpkgs.config.allowUnfree = true;

      users.users."felix" = {
        isNormalUser = true;
        description = "Felix";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
      };

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

        # use the example session manager (no others are packaged yet so this is enabled by default,
        # no need to redefine it in your config for now)
        #media-session.enable = true;
      };
      system.stateVersion = "26.05"; # do not change!!!!
    };
}
