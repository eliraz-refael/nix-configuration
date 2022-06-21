{ config, lib, pkgs, ... }:

{
  services = {

    blueman.enable = true;

    # Enable CUPS to print documents.
    printing.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

    xserver = {
      enable = true;
      displayManager = {
        gdm.enable = true;
        defaultSession = "none+leftwm";
      };
      desktopManager = {
        gnome = {
          enable = true;
        };
      };
      windowManager.i3.enable = true;
      windowManager.leftwm.enable = true;
      layout = "us,il";
      xkbVariant = "";
      xkbOptions = "grp:alt_shift_toggle";
    };

  };
}
