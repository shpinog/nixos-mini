{ pkgs, config, lib, ... }: {

services.gnome.gnome-keyring.enable = true;
security.polkit.enable = true;
security.rtkit.enable = true;


environment.systemPackages = with pkgs; [ lxqt.lxqt-policykit ]; # provides a default authentification client for policykit
security.pam.services.shpinog.startSession = true;
security.polkit.extraConfig = ''

  polkit.addRule(function(action, subject) {
    if ((action.id == "org.corectrl.helper.init" ||
         action.id == "org.corectrl.helperkiller.init") &&
        subject.local == true &&
        subject.active == true &&
        subject.isInGroup("users")) {
            return polkit.Result.YES;
    }
  });


  polkit.addRule(function(action, subject) {
    if ((action.id == "org.radeon-profile.helper.init" ||
         action.id == "org.radeon-profile.helperkiller.init") &&
        subject.local == true &&
        subject.active == true &&
        subject.isInGroup("users")) {
            return polkit.Result.YES;
    }
  });

  
  '';







}
