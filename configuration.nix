# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  imports = [ # Include the results of the hardware scan.
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ./hardware-configuration.nix
    ./network.nix
    ./home-manager/home-manager.nix
    ./configuration-fonts.nix
    ./configuration-packages.nix
    ./configuration-xserver.nix
    ./hardware.nix
    ./polkit.nix
    ./kernel.nix
  ];

#Enable nonfree and unstable
  nixpkgs.config = {
  allowUnfree = true;
  joypixels.acceptLicense = true;
  
  packageOverrides = pkgs: {

    unstable = import <nixos-unstable> {
      config = config.nixpkgs.config;
    };
  };
  };

  
  nix.autoOptimiseStore = true;
  networking.hostId = "d1be0afd";
  services.gvfs.enable = true;
  services.earlyoom.enable = true;
  services.earlyoom.freeMemThreshold = 5;
  services.earlyoom.freeSwapThreshold = 10;
  services.earlyoom.useKernelOOMKiller = true;
  services.dbus.packages = with pkgs; [ gnome3.dconf ];
  environment.variables.EDITOR = "nvim";

  # Networking
 
  networking.useDHCP = false;
  networking.enableIPv6 = true;
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;
  services.openssh.enable = true;
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 8868 4668 4679 22 ];
  networking.firewall.allowedUDPPorts = [8868 4679 ];
  #networking.interfaces.enp7s0.useDHCP = true;


  # Select internationalisation properties.
  i18n.defaultLocale = "ru_RU.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Set your time zone.
  time.timeZone = "Europe/Moscow";


  

  #User and shell settings

  programs.bash.enableLsColors = true;
  programs.bash.vteIntegration = true;
  programs.bash.enableCompletion = true;
  programs.tmux = {
  enable = true;
  newSession = true;
};




 users.users.shpinog = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "storage" "media" "docker" "lp" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.bash;
  };



  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

}

