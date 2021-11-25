{ config, pkgs, ... }: {
  services.xserver.xkbOptions = "grp:caps_toggle, grp_led:caps";
  services.xserver.xkbVariant = "winkeys";
  services.xserver.layout = "us,ru(winkeys)";
 services.xserver.displayManager.defaultSession = "awesome";

  services.xserver.displayManager.startx= {
    enable = true;
  };
#  services.xserver.displayManager.autoLogin.enable = true;
#  services.xserver.displayManager.autoLogin.user = "shpinog";


programs.sway = {

  enable = true;
  wrapperFeatures.gtk = true;


  extraPackages = with pkgs; [
  swaylock
  swayidle
  wl-clipboard
  mako # notification daemon
  waybar
  xdg-desktop-portal
  xdg-desktop-portal-wlr
  grim
  ];
};

  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_390;
  services.xserver = {
    enable = true;
    autorun = false;
    videoDrivers = [ "nouveau" ];


    # deviceSection = ''
    #   Option "TearFree" "false"
    # '';




    libinput.enable = true;
    config = ''
      Section "InputClass"
        Identifier "mouse accel"
        Driver "libinput"
        MatchIsPointer "on"
        Option "AccelProfile" "flat"
        Option "AccelSpeed" "0"
      EndSection
    '';




       # Enable the Awesome Desktop Environment.

    windowManager = {
       awesome = {
       enable = true;
       luaModules = [ pkgs.luaPackages.luafilesystem pkgs.luaPackages.cjson ];
      };
    };



  };
}
