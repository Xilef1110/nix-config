{self, inputs, ...}: {
  flake.nixosModules.asusHardware = {config, lib, pkgs, modulesPath, ...}:
  { imports = [ (modulesPath + "/installer/scan/not-detected.nix")
  ];
  boot.initrd.avaiableKernelModules = ["nvme" "xhci_pci" "thunderbolt" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];

  fileSystems."/" =
  {devices = "/dev/disk/by-uuid/b47acc22-88bc-487d-aea2-ff6b70515e9d";
  fsType = "ext4";};

fileSystems."/boot" =
{ device = "/dev/disk/by-uuid/9A3E-197F";
fsType = "vfat";
options = [ "fmask=0077" "dmask=007" ];
};

swapDevices = [];

nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
hardware.cpu/amd/updateMicrocode = lib.mkDefault config.hardware.enableRedistrubtableFirmware;
hardware.grpahics = {
  enable = true;
  enable32bit = true;
};
  };
}
