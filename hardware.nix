{ pkgs, config, lib, ... }:{

  
  hardware.enableRedistributableFirmware = true; # For some unfree drivers
  hardware.cpu.intel.updateMicrocode = true;
  hardware.enableAllFirmware = true;
  powerManagement.cpuFreqGovernor = "schedutil";
  services.udisks2.enable = true;
  programs.gnome-disks.enable = true;






  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
   	intel-media-driver # LIBVA_DRIVER_NAME=iHD
   	vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
   	vaapiVdpau
	libvdpau-va-gl
    ];
    driSupport = true;
    driSupport32Bit = true; # For steam
  };





  
 sound.enable = true;

  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };

  
  hardware.bluetooth.enable = false;


}
