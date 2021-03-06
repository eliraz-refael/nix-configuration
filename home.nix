{ config, lib, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.eliraz = {
    home.pointerCursor.package = pkgs.vanilla-dmz;
    home.pointerCursor.name = "Vanilla-DMZ";

    programs = {

      home-manager = {
        enable = true;
      };


      zsh = {
        enable = true;
        enableAutosuggestions = true;
        enableCompletion = true;
        enableSyntaxHighlighting = true;
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

      exa = {
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
      };

      topgrade = {
        enable = true;
      };

    };
  };
}
