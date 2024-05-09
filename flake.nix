{
  description = "Allow flakes to be used with Nix";


  inputs = {
    
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };


  outputs = {...} @ inputs: let
    # super simple boilerplate-reducing
    # lib with a bunch of functions
    myLib = import ./myLib/default.nix {inherit inputs;};
  in
    with myLib; {
      nixosConfigurations = {
        # ===================== NixOS Configurations ===================== #
      };

      homeConfigurations = {
        # ================ Maintained home configurations ================ #
      };

      homeManagerModules.default = ./homeManagerModules;
      nixosModules.default = ./nixosModules;
    };


}
