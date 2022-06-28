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
    conky
    clojure
    clj-kondo
    dmenu
    emacs
    fd
    feh
    ffmpeg_5  # Firefox codec for playing audio from places like Tidal
    firefox
    fzf
    git
    google-chrome
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
    ispell
    vim
    wget
    yarn
  ];

}
