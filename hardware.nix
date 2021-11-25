{ pkgs, config, lib, ... }:

with rec { inherit (config) device devices deviceSpecific; };
with deviceSpecific; {

  
  hardware.enableRedistributableFirmware = true; # For some unfree drivers
  hardware.cpu.intel.updateMicrocode = true;
  hardware.enableAllFirmware = true;
  powerManagement.enable = false;






 hardware.opengl = {
   enable = true;
   extraPackages = with pkgs; [
     vaapiVdpau
     libvdpau-va-gl
     rocm-opencl-icd
     rocm-opencl-runtime
     
     
   ];
   driSupport = true;
   driSupport32Bit = true; # For steam
 };



security.rtkit.enable = true;
services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
  jack.enable = true;
  # If you want to use JACK applications, uncomment this
  

  # use the example session manager (no others are packaged yet so this is enabled by default,
  # no need to redefine it in your config for now)
  #media-session.enable = true;
};

  
 sound.enable = true;
  hardware.pulseaudio.daemon.config ={
    avoid-resampling = "yes";
    resample-method = "soxr-vhq";
    default-sample-rate = "48000";
    default-sample-format = "s32le";
  };

  hardware.pulseaudio = {
    enable = false;
    package = pkgs.pulseaudioFull;
    extraModules = [ pkgs.pulseaudio-modules-bt ];
    extraConfig = "load-module module-echo-cancel use_master_format=1 aec_method=webrtc source_name=echoCancel_source sink_name=echoCancel_sink
set-default-source echoCancel_source
set-default-sink echoCancel_sink
    ";
  };

  
  hardware.bluetooth.enable = true;
   services.blueman.enable = true;
  hardware.bluetooth.settings ={

      General = {
         # MultiProfile = "multiple";
         # ControllerMode = "bredr";
         FastConnectable = "true";
         
      };
  };


}
