{ config, lib, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.eliraz = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Eliraz Kedmi";
    extraGroups = [ "networkmanager" "wheel" ];
  };

}
