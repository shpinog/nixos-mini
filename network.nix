{ pkgs, config, ... }: {
  networking.firewall.checkReversePath = false; # maybe "loose" also works, untested
  networking.usePredictableInterfaceNames = true;
  

  networking.firewall.allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
  networking.firewall.allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];

  systemd.services.wakeonlan = {
    description = "Reenable wake on lan every boot";
    after = [ "network.target" ];
    serviceConfig = {
      Type = "simple";
      RemainAfterExit = "true";
      ExecStart = "${pkgs.ethtool}/sbin/ethtool -s enp7s0 wol g";
    };
    wantedBy = [ "default.target" ];
  };

 }
