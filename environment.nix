{ config, lib, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.sessionVariables = {
      PATH = ["~/.cargo/bin" "~/.npm-packages/bin" ""];
      NODE_PATH = ["~/.npm-packages/lib/node_modules"];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    ( emacs.override { nativeComp = true; } )
    alacritty
    arandr
    autorandr
    beancount
    bitwarden
    bitwarden-cli
    clj-kondo
    clojure
    clojure-lsp
    cmake
    conky
    dmenu
    editorconfig-core-c
    elixir
    elixir_ls
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
    ledger
    libxkbcommon
    microsoft-edge
    nitrogen
    nodejs-18_x
    pcmanfm
    picom
    polybar
    ripgrep
    rofi
    shellcheck
    signal-desktop
    sqlite
    sublime4
    unzip
    vim
    wget
    xclip
    yarn
  ];

}
