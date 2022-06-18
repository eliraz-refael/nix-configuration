{ config, lib, pkgs, ... }:

{
  fonts.fonts = with pkgs; [
    iosevka
    culmus
    nerdfonts
  ];
}
