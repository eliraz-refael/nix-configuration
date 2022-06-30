{ config, lib, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty
    arandr
    autorandr
    bitwarden
    bitwarden-cli
    clj-kondo
    clojure
    conky
    dmenu
    ( emacs.override { nativeComp = true; } )
    fd
    feh
    ffmpeg_5  # Firefox codec for playing audio from places like Tidal
    firefox
    fzf
    git
    google-chrome
    ispell
    kitty
    libxkbcommon
    nitrogen
    nodePackages.npm-check-updates
    nodejs-18_x
    picom
    polybar
    ripgrep
    rofi
    signal-desktop
    sqlite
    unzip
    vim
    wget
    yarn
  ];

}
