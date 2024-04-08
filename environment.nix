{ config, lib, pkgs, libclang, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
  flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz";

  hyprland-flake = (import flake-compat {
    src = builtins.fetchTarball "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
  }).defaultNix;
in {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.sessionVariables = {
      PATH = ["~/.cargo/bin" "~/.npm-packages/bin" ""];
      NODE_PATH = ["~/.npm-packages/lib/node_modules"];
      LSP_USE_PLISTS = ["true"];
      WLR_NO_HARDWARE_CURSORS=["1"];
      MOZ_ENABLE_WAYLAND=["1"];
  };

  programs = {
    fish.enable = true;
    hyprland = {
      enable = true;
      package = hyprland-flake.packages.${pkgs.system}.hyprland;
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    ( emacs29.override { withNativeCompilation = true; } )
    alacritty
    arandr
    autorandr
    beancount
    bitwarden
    bitwarden-cli
    cargo
    clj-kondo
    clojure
    clojure-lsp
    cmake
    conky
    deno
    dmenu
    dosbox
    dunst
    editorconfig-core-c
    elixir
    fd
    feh
    ffmpeg_5  # Firefox codec for playing audio from places like Tidal
    firefox
    fzf
    gcc
    git
    google-chrome
    i3lock
    imagemagick
    inotify-tools
    ispell
    kitty
    ledger
    libxkbcommon
    logseq
    microsoft-edge
    nitrogen
    nodejs_20
    opera
    pcmanfm
    picom
    pkg-config
    polybar
    ranger
    ripgrep
    rofi
    rust-analyzer
    shellcheck
    signal-desktop
    slack
    sqlite
    steam
    sublime4
    texlive.combined.scheme-full
    unstable.bun
    unstable.bruno
    unstable.elixir-ls
    unstable.neovim
    unstable.qutebrowser
    unstable.rustc
    unzip
    waybar
    wget
    wofi
    xclip
    xmobar
    yarn
    zip
    zoom-us
  ];

}
