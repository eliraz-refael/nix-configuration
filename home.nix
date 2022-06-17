{ config, lib, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.eliraz = {
    programs = {

      home-manager = {
        enable = true;
      };

      zsh = {
        enable = true;
        shellAliases = {
          ll = "ls -l";
          update = "sudo nixos-rebuild switch";
        };
        history = {
          size = 10000;
        };
        oh-my-zsh = {
          enable = true;
          plugins = [ "git" "thefuck" ];
          theme = "robbyrussell";
        };
      };

      git = {
        enable = true;
        userName  = "Eliraz Kedmi";
        userEmail = "eliraz.kedmi@fundguard.com";
      };
    };
  };
}
