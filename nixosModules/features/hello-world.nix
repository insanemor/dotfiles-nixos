{ config, lib, pkgs, ... }:

{
      
  environment.systemPackages = with pkgs; [
    (writeShellScriptBin "hello-world" ''
      echo "Hello, world!"
    '')
  ];
    

}
