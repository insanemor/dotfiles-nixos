{
  pkgs,
  lib,
  ...
}: {

  myNixOS = {
    hello-world.enable = lib.mkDefault true;
  };

}