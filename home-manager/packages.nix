{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    htop
    firefox
    sshfs
    smplayer
    kitty
    mpv
    qbittorrent
    viewnior
    networkmanagerapplet
    ffmpeg-full
    pavucontrol
    hicolor_icon_theme
  ];
}
