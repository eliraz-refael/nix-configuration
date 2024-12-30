{ config, lib, pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_6_6;
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
    };
  };
}
