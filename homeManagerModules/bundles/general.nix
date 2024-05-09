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


  home.packages = with pkgs; [
    wget
  ];


}