{ config, lib, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.eliraz = {
    home.pointerCursor.package = pkgs.vanilla-dmz;
    home.pointerCursor.name = "Vanilla-DMZ";
    home.stateVersion = "24.05";

    programs = {

      home-manager = {
        enable = true;
      };

      fish = {
        enable = true;
        shellAliases = {
          ll = "ls -l";
          screenshot = "import png:- | xclip -selection clipboard -t image/png";
          update = "sudo nixos-rebuild switch";
          upgrade = "sudo nixos-rebuild switch --upgrade";
          emacs-upgrade = "~/.emacs.d/bin/doom upgrade";
          emacs-sync = "~/.emacs.d/bin/doom sync";
          emacs-restart = "systemctl restart --user emacs";
          cat = "bat";
          ls = "exa -l --icons";
          vim = "nvim";
        };
      };
      zsh = {
        enable = true;
        enableAutosuggestions = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;
        shellAliases = {
          ll = "ls -l";
          screenshot = "import png:- | xclip -selection clipboard -t image/png";
          update = "sudo nixos-rebuild switch";
          upgrade = "sudo nixos-rebuild switch --upgrade";
          emacs-upgrade = "~/.emacs.d/bin/doom upgrade";
          emacs-sync = "~/.emacs.d/bin/doom sync";
          emacs-restart = "systemctl restart --user emacs";
          cat = "bat";
          ls = "exa -l --icons";
          vim = "nvim";
        };
        history = {
          size = 10000;
        };
        oh-my-zsh = {
          enable = true;
          plugins = [ "git" ];
          theme = "robbyrussell";
        };
      };

      eza = {
        enable = true;
      };

      git = {
        enable = true;
        userName  = "Eliraz Kedmi";
        userEmail = "eliraz.kedmi@fundguard.com";
      };

      java = {
        enable = true;
      };

      broot = {
        enable = true;
        enableZshIntegration = true;
      };

      bat = {
        enable = true;
      };

      nnn = {
        enable = true;
      };

      zoxide = {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
      };

      direnv = {
        enable = true;
        enableZshIntegration = true;
        nix-direnv = {
          enable = true;
        };
      };

      ssh = {
        enable = true;
        matchBlocks = {
          "ssh.dev.azure.com" = {
            extraOptions = {
              "HostkeyAlgorithms"  = "+ssh-rsa";
              "PubkeyAcceptedAlgorithms" = "+ssh-rsa";
              "User" = "git";
            };
          };
        };
      };

      starship = {
        enable = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
      };

      topgrade = {
        enable = true;
      };

    };
  };
}
