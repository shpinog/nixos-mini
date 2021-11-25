{ config, pkgs, ... }: {


  fonts = {

    fontDir.enable = true;
    enableGhostscriptFonts = true;
    enableDefaultFonts = true;
    fonts = with pkgs; [
      ubuntu_font_family
      noto-fonts-emoji
      font-awesome
      font-awesome_4
      unifont
      joypixels
      dejavu_fonts
    ];

    fontconfig = {
	enable = true;

    defaultFonts = {
      serif = [ "Ubuntu" "Noto" ];
      sansSerif = [ "Ubuntu" "Noto" ];
      monospace = [ "Sans" ];
      emoji = [ "Noto Color Emoji" "Twitter Color Emoji" "JoyPixels" "Unifont" "Unifont Upper"];

    };
   };
  };

}
