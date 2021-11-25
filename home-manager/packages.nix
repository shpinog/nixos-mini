{ config, pkgs, ... }: {

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
      htop
      nmap
      tcpdump
      ngrep
      sshfs
      ipscan
      arc-theme
      smplayer
      discord
      breeze-qt5
      kitty
      mpv
      ddrescue
      udiskie
      usbutils
      slurp # wayland
      #
      qbittorrent
      networkmanagerapplet
      okular
      lxappearance
      ffmpeg-full
      peek
      pavucontrol
      audio-recorder
      gnome3.adwaita-icon-theme
      hicolor_icon_theme
  ];
}
