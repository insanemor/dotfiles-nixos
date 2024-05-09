{ 
  config, 
  pkgs,
  lib,
  myLib,
  ... 
}: let
  cfg = config.git-user;
in {

  options.git = {
      enable = lib.mkEnableOption "Configuracao do Git Config";
      
      username = lib.mkOption {
        default = "";
        description = "Username do Git";
      };
      name = lib.mkOption {
        default = "";
        description = "Nome do Usuario do git";
      };
      email = lib.mkOption {
        default = "";
        description = "Email para acesso ao git";
      };
  }; 

  config = lib.mkIf cfg.enable {

    home.packages = [ pkgs.git ];

    programs.git = {
      enable = true;
      userName = ${cfg.username};
      userEmail = ${cfg..email};
      extraConfig = {
        init.defaultBranch = "main";
        safe.directory = "/home/" + ${cfg.username} + "/.dotfiles";
      };
    };

    home.file."GIT/.keep".text = ''
      Welcome to the Insane world ! 
    
    '';

  };


}
