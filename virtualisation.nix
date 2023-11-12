{ config, lib, pkgs, ... }:

{
  virtualisation = {
    lxd.enable = true;
    docker.enable = true;
  };
}
