{pkgs, ...}: {
  hardware.uinput.enable = true;
  users.groups.uinput.members = ["ins"];
  users.groups.input.members = ["ins"];
}