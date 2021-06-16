{ config, pkgs, ... }: {


  home.file.".icons/default".source =
    "${pkgs.breeze-qt5}/share/icons/breeze_cursors";


  home.file = {
    ".config/kitty/kitty.conf".source = ../configFiles/kitty.conf; #kitty config
    ".config/ranger".source = ../configFiles/ranger; #ranger config
    "/.tmux.conf".source = ../configFiles/.tmux/.tmux.conf; #tmux config
    "/.tmux.conf.local".source = ../configFiles/.tmux/.tmux.conf.local; #tmux config

  };



}
