{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  imports = [
    #inputs.nix-colors.homeManagerModules.default
  ];

  nixpkgs = {
    config = {
      # allowUnfree = true;
      experimental-features = "nix-command flakes";
    };
  };

  # Adiciona todas as features do home-manager
  myHomeManager = {    
    taskfile.enable = lib.mkDefault true;
    git = {
      enable = lib.mkDefault true;
      userName = "ins";
      name = "Moreira";
      userEmail = "moreira@zaia.com.br";
    };
  };


  programs.home-manager.enable = true;


  home.stateVersion = "23.11"; # Please read the comment before changing.
  
  home.packages = with pkgs; [
    # Core
    alacritty
    firefox
    kate

    # Media
    gimp
    vlc
  ];


}