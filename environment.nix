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
    nodePackages.npm
    nodePackages.npm-check-updates
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodejs-18_x
    openssl
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
