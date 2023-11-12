{ config, lib, pkgs, ... }:

{
  powerManagement.cpuFreqGovernor = "performance";
  boot = {
    kernelPackages = pkgs.linuxPackages_6_5;
    kernelParams = [ "processor.ignore_ppc=1" ];
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot/efi";
    };
  };
}
