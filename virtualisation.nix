{ config, lib, pkgs, ... }:

{
  virtualisation = {
    lxd.enable = true;
    virtualbox.host.enable = true;
  };
}
