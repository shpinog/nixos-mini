{ config, pkgs, ... }:

let
  unstable = import <unstable> { };
  home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    rev = "148d85ee8303444fb0116943787aa0b1b25f94df";
    ref = "release-21.05";
  };
in
{

  imports = [
    (import "${home-manager}/nixos")
  ];



  home-manager.users."shpinog" = {

    imports = [
      ./programs.nix
      ./packages.nix
      ./settings.nix
      ./config-files.nix
      ./aliases.nix
    ];

  };

}

