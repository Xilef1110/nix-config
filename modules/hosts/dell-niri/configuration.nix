{ self, inputs, ... }:
{
  flake.nixosModules.dellNiriConfiguration =
    { config, pkgs, ... }:

    {
      imports = [
        # Include the results of the hardware scan.
        self.nixosModules.myMachineHardware
        self.nixosModules.myHomeManager
        # self.nixosModules.dellNiriHomeModule
        self.nixosModules.niri
      ];

      # Bootloader.
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      networking.hostName = "nixos"; # Define your hostname.
      # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

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
      # Enable touchpad support (enabled default in most desktopManager).
      # services.xserver.libinput.enable = true;

      # Define a user account. Don't forget to set a password with ‘passwd’.
      users.users.felix = {
        isNormalUser = true;
        description = "Felix Stock";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        packages = with pkgs; [
          #  thunderbird
        ];
      };
      home-manager.users.felix = self.homeModules.felixModule;

      # Install firefox.
      programs.firefox.enable = true;

      # Allow unfree packages
      nixpkgs.config.allowUnfree = true;

      # List packages installed in system profile. To search, run:
      # $ nix search wget
      environment.systemPackages = with pkgs; [
        #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
        #  wget
        # helix
        signal-desktop
        onedrivegui
        thunderbird
        wl-clipboard
        git
        _1password-gui
        nil
        libreoffice
        ignition
        nautilus
        obsidian
        discord
      ];

      # List services that you want to enable:
      hardware.bluetooth.enable = true;
      networking.wireless.enable = true;
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      services.power-profiles-daemon.enable = true;
      services.upower.enable = true;

      # This value determines the NixOS release from which the default
      # settings for stateful data, like file locations and database versions
      # on your system were taken. It‘s perfectly fine and recommended to leave
      # this value at the release version of the first install of this system.
      # Before changing this value read the documentation for this option
      # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
      system.stateVersion = "25.11"; # Did you read the comment?

    };
}
