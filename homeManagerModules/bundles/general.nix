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