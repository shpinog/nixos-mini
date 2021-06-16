{ config, pkgs, system, ... }:


let

unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in

{


    environment.systemPackages = with pkgs; [
    xclip
    xsel
    rofi
    sudo
    glib
    kitty
    killall
    clinfo
    gnupg
    unstable.spotify
    lm_sensors
    breeze-icons
    ntfs3g
    glibc
    wget
    unzip
    unar
    git
    sysctl
    neovim
    flameshot
    dmenu
    coreutils
    iw
    networkmanager-openvpn

  ];

programs = {
  gnupg.agent = {
    enable = true;
    pinentryFlavor = "curses";
    enableSSHSupport = true;
  };
};



}

