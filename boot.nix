{ config, lib, pkgs, ... }:

{
  powerManagement.cpuFreqGovernor = "performance";
  boot = {
    kernelPackages = pkgs.linuxPackages_6_8;
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
