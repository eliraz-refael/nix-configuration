{ config, lib, pkgs, ... }:

{
    fonts.fontconfig.antialias = true;
    fonts.packages = with pkgs; [
        anonymousPro
        culmus
        fantasque-sans-mono
        iosevka-bin
        jetbrains-mono
        monoid
        nerdfonts
        ubuntu_font_family
        victor-mono
        font-awesome
    ];
}
