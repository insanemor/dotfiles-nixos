{ config, pkgs, ... }:

{
  home.packages = [ pkgs.git ];

  programs.git = {
    enable = true;
    userName = config.userSettings.name;
    userEmail = config.userSettings.email;
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/home/" + userSettings.username + "/.dotfiles";
    };
  };

  home.file."GIT/.keep".text = ''
    Welcome to the Insane world ! 
  
  '';


}
