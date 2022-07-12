{ config, lib, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.sessionVariables = {
      PATH = ["/home/eliraz/.cargo/bin"];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    ( emacs.override { nativeComp = true; } )
    alacritty
    arandr
    autorandr
    microsoft-edge
    beancount
    bitwarden
    bitwarden-cli
    clj-kondo
    clojure
    conky
    dmenu
    fd
    feh
    ffmpeg_5  # Firefox codec for playing audio from places like Tidal
    firefox
    fzf
    git
    google-chrome
    i3lock
    imagemagick
    ispell
    kitty
    libxkbcommon
    nitrogen
    nodePackages.npm-check-updates
    nodejs-18_x
    pcmanfm
    picom
    polybar
    ripgrep
    rofi
    signal-desktop
    sqlite
    sublime4
    unzip
    vim
    wget
    yarn
  ];

}
