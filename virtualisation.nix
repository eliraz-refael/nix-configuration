{ config, lib, pkgs, ... }:

{
  virtualisation = {
    docker = {
      enable = true;
    };
    lxd = {
      enable = true;
    };
  };
}
