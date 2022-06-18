{ config, lib, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
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
    nodejs
    nodePackages.npm
    unzip
    google-chrome
  ];

}
