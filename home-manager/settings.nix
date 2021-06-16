{ config, pkgs, ... }: {


  home.keyboard = {
    layout = "us,ru(winkeys)";
    options = [ "grp:caps_toggle" "grp_led:caps" ];
  };


}
