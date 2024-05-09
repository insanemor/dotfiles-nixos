{
  pkgs,
  config,
  ...
}: {

  
  home.file."./dconf/Taskfile.yml".text = ''
    version: '3'
    tasks:
      hello:
        silent: true
        cmds:
          - echo "Hello from the remote Taskfile as new repo!"
  '';


}