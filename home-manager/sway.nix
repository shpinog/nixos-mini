{ config, pkgs, ... }: {
  

wayland.windowManager.sway = {

enable = true;
wrapperFeatures.gtk = true;

};

  home.packages = with pkgs; [
  swaylock
  swayidle
  wl-clipboard
  waybar
  xdg-desktop-portal
  xdg-desktop-portal-wlr
  grim
  ];
}
