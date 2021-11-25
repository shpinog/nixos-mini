{ config, pkgs, ... }: {


  gtk = {
    enable = true;
    theme = {
      name = "Yaru-dark";
      package = pkgs.yaru-theme;
    };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
    font = {
      name = "IBM Plex 12";
    };
    gtk3.extraConfig.gtk-cursor-theme-name = "breeze";
  };


  programs = {

     chromium = {
      enable = true;
      package = pkgs.chromium.override({
      commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland --flag-switches-begin --enable-gpu-rasterization --enable-zero-copy --ignore-gpu-blocklist --enable-features=UseOzonePlatform,NativeNotifications,VaapiVideoDecoder,Vulkan,WebRTCPipeWireCapturer --flag-switches-end";
      });
    
  };


      git = {
        enable = true;
        userName = "Shpinog";
        userEmail = "shpinog@gmail.com";
      };

      emacs = {
        enable = true;
        package = pkgs.emacs-nox;
                

      };

      rofi = {
        enable = true;
        font = "Hack 16";
      
      };

      starship = {
        enable = true;
      };

      bash = {
        enable = true;
      }; 

      mpv = {
        enable = true;
        config = 
        {
          profile = "gpu-hq";
          keepaspect = "no" ;
          deband = "no";
          force-window = true;
          ytdl-format = "bestvideo+bestaudio";
          cache = "yes";
          cache-on-disk = "yes";
          cache-pause-initial = "yes";
          cache-pause-wait = "10";
          interpolation = "yes";
          video-sync = "display-resample";
          tscale = "oversample";
          hwdec = "auto-safe";
          vo = "gpu,vx";
          hwdec-codecs = "all";
        };
      };
    };
  }
