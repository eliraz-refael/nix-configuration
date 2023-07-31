{ config, lib, pkgs, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
      "electron-20.3.11"
  ];

  environment.sessionVariables = {
      PATH = ["~/.cargo/bin" "~/.npm-packages/bin" ""];
      NODE_PATH = ["~/.npm-packages/lib/node_modules"];
      LSP_USE_PLISTS = ["true"];
  };

  programs.fish.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    ( emacs.override { withNativeCompilation = true; } )
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
    deno
    dmenu
    dosbox
    editorconfig-core-c
    elixir_1_15
    unstable.elixir-ls
    fd
    feh
    ffmpeg_5  # Firefox codec for playing audio from places like Tidal
    firefox
    fzf
    git
    google-chrome
    i3lock
    imagemagick
    inotify-tools
    ispell
    kitty
    ledger
    logseq
    libxkbcommon
    microsoft-edge
    nitrogen
    nodejs_20
    pcmanfm
    picom
    polybar
    ripgrep
    rofi
    shellcheck
    signal-desktop
    slack
    steam
    sqlite
    sublime4
    texlive.combined.scheme-full
    unzip
    vim
    wget
    xclip
    xmobar
    yarn
    zip
    zoom-us
  ];

}
