{ config, pkgs, ... }: {


  fonts = {

    fontDir.enable = true;
    enableGhostscriptFonts = true;
    enableDefaultFonts = true;
    fonts = with pkgs; [
      ubuntu_font_family
      inconsolata-nerdfont
      twemoji-color-font
      joypixels
      dejavu_fonts
      ubuntu_font_family
    ];

    fontconfig.enable = true;

    fontconfig.defaultFonts = {
      serif = [ "Ubuntu" "Noto" ];
      sansSerif = [ "Ubuntu" "Noto" ];
      monospace = [ "Sans" ];
    };
  };
}
