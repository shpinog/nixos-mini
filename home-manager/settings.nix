{ config, pkgs, ... }: {



  services.emacs = {
     enable = true;
     package = pkgs.emacs-nox;
     socketActivation.enable = true;
     client = {
     enable = true;
     arguments = [ "-c" ];
     };
  };


  xdg = {
    enable = true;
  };

  services.kdeconnect = {
    enable = true;
    indicator = true;
  };

  home.keyboard = {
    layout = "us,ru(winkeys)";
    options = [ "grp:caps_toggle" "grp_led:caps" ];
  };

  home.sessionVariables = {
  MOZ_ENABLE_WAYLAND = 1;
  XDG_CURRENT_DESKTOP = "sway";
  XDG_SESSION_TYPE = "wayland";
  _JAVA_AWT_WM_NONREPARENTING = "1";
  QT_QPA_PLATFORM = "wayland";
  QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
};


}
