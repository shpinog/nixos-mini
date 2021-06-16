{ config, pkgs, lib, ... }:{

# Boot and modules
  nix.buildCores= 4;
  nix.maxJobs = lib.mkDefault 4;
  boot.kernelPackages = pkgs.linuxPackages_xanmod; 
  boot.initrd.availableKernelModules = [ "ehci_pci" "ahci" "xhci_pci" "usb_storage" "usbhid" "sd_mod" ];
  #boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  security.apparmor.enable = false;
  zramSwap.enable = true;
  zramSwap.algorithm = "zstd" ;


### Boot Kernel

  # Use the systemd-boot EFI boot loader.

  boot = {
    loader = {
	grub.enable = true;
	grub.device = "/dev/sda";
	timeout = 2;
    };

    consoleLogLevel = 3;
    extraModprobeConfig = "options ec_sys wVrite_support=1";
    #kernel.sysctl."vm.swappiness" = 50;
    #kernel.sysctl."kernel/sysrq" = 1;
    #kernel.sysctl."abi.vsyscall32" = 0; 
    kernelParams = [
      "quiet"
      "mitigations=off"
      
    ];
  };



}
