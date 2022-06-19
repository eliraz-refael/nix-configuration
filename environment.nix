{ config, lib, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    firefox
    git
    emacs
    kitty
    alacritty
    dmenu
    rofi
    nitrogen
    fd
    ripgrep
    polybar
    picom
    conky
    feh
    arandr
    autorandr
    libxkbcommon
    openssl
    signal-desktop
    yarn
    nodejs-18_x
    nodePackages.npm
    unzip
    google-chrome
    sqlite
    bitwarden
    bitwarden-cli
  ];

}
