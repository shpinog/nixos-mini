{ config, pkgs, ... }: {


  gtk = {
    enable = true;
    iconTheme = {
      name = "Qogir";
      package = pkgs.qogir-theme;
    };
    font = {
      name = "IBM Plex 12";
    };
    gtk3.extraConfig.gtk-cursor-theme-name = "breeze";
  };


  programs = {
    git = {
      enable = true;
      userName = "Shpinog";
      userEmail = "shpinog@gmail.com";
    };
  };


}
