{ 
  config, 
  pkgs,
  lib,
  myLib,
  ... 
}: let
  cfg = config.myNixOS;
in {

  options = {
    myNixOS = {
      enable = lib.mkEnableOption "My NixOS";
      userSettings = {
        enable = lib.mkEnableOption "User settings";
        username = lib.mkOption {
          type = types.str;
          default = "";
          description = "The username of the user";
        };
        name = lib.mkOption {
          type = types.str;
          default = "";
          description = "The name of the user";
        };
        email = lib.mkOption {
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
      userName = ${cfg.name};
      userEmail = ${cfg.userSettings.email};
      extraConfig = {
        init.defaultBranch = "main";
        safe.directory = "/home/" + ${cfg.userSettings.username} + "/.dotfiles";
      };
    };

    home.file."GIT/.keep".text = ''
      Welcome to the Insane world ! 
    
    '';

  };


}
