{ config, lib, pkgs, libclang, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
  flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz";

  hyprland-flake = (import flake-compat {
    src = builtins.fetchTarball "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
  }).defaultNix;
in {

  environment.sessionVariables = {
      PATH = ["~/.cargo/bin" "~/.npm-packages/bin" ""];
      NODE_PATH = ["~/.npm-packages/lib/node_modules"];
      LSP_USE_PLISTS = ["true"];
      WLR_NO_HARDWARE_CURSORS=["1"];
      MOZ_ENABLE_WAYLAND=["1"];
      UV_USE_IO_URING=["0"]; # temporary fix for yarn not able to install stuff due to issue with uring
      # WLR_DRM_DEVICES=["/dev/dri/card1"]; # start hyprland on nvidia, to start on intel, comment this line out.
  };

  programs = {
    fish.enable = true;
    hyprland = {
      enable = true;
      # package = hyprland-flake.packages.${pkgs.system}.hyprland;
    };
    river = {
      enable = true;
    };
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };
  };

  # nixpkgs.overlays = [
  #   (self: super: {
  #     # Customizing Node.js
  #     nodejs = super.nodejs.overrideAttrs (oldAttrs: rec {
  #       NIX_CFLAGS_COMPILE = oldAttrs.NIX_CFLAGS_COMPILE or "" + " -O3 -march=native";
  #     });

  #     # Customizing Yarn
  #     yarn = super.yarn.overrideAttrs (oldAttrs: rec {
  #       NIX_CFLAGS_COMPILE = oldAttrs.NIX_CFLAGS_COMPILE or "" + " -O3 -march=native";
  #     });
  #   })
  # ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    ( emacs29-pgtk.override { withNativeCompilation = true; } )
    alacritty
    arandr
    autorandr
    beancount
    bitwarden
    brightnessctl
    bitwarden-cli
    cargo
    clj-kondo
    clojure
    clojure-lsp
    cmake
    conky
    deno
    devbox
    dmenu
    dosbox
    dunst
    editorconfig-core-c
    elixir
    fd
    feh
    ffmpeg_5  # Firefox codec for playing audio from places like Tidal
    firefox-bin
    fzf
    gcc
    git
    google-chrome
    gnomeExtensions.pop-shell
    grim
    i3lock
    imagemagick
    inotify-tools
    ispell
    jq
    kitty
    ledger
    libxkbcommon
    libnotify
    logseq
    mako
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
    slack
    sqlite
    slurp
    swaybg
    swww
    steam
    sublime4
    swaylock
    texlive.combined.scheme-full
    unstable.bun
    unstable.elixir-ls
    unstable.neovim
    unstable.qutebrowser
    unstable.rustc
    unstable.signal-desktop
    unstable.yarn
    unzip
    waybar
    waypaper
    wdisplays
    wget
    wofi
    wl-clipboard
    xclip
    # xmobar
    xwayland
    zip
    zoom-us
  ];

}
