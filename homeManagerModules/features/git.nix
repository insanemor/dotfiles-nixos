{ config, pkgs, ... 

}: let
  cfg = config.myNixOS;
in {

  options = {
    myNixOS = {
      enable = mkEnableOption "My NixOS";
      userSettings = {
        enable = mkEnableOption "User settings";
        username = mkOption {
          type = types.str;
          default = "";
          description = "The username of the user";
        };
        name = mkOption {
          type = types.str;
          default = "";
          description = "The name of the user";
        };
        email = mkOption {
          type = types.str;
          default = "";
        };
      };
    }; 
  };

  config = {

    home.packages = [ pkgs.git ];

    programs.git = {
      enable = true;
      userName = config.userSettings.name;
      userEmail = config.userSettings.email;
      extraConfig = {
        init.defaultBranch = "main";
        safe.directory = "/home/" + config.userSettings.username + "/.dotfiles";
      };
    };

    home.file."GIT/.keep".text = ''
      Welcome to the Insane world ! 
    
    '';

  };


}
