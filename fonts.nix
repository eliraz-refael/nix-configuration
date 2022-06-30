{ config, lib, pkgs, ... }:

{
  fonts.fonts = with pkgs; [
    iosevka
    monoid
    jetbrains-mono
    ubuntu_font_family
    victor-mono
    fantasque-sans-mono
    anonymousPro
    culmus
    nerdfonts
  ];
}
