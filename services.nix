{ config, lib, pkgs, ... }:

{
  services = {

    blueman.enable = true;

    # Enable CUPS to print documents.
    printing = {
      enable = true;
      drivers = [pkgs.hplip];
    };

    avahi = {
      enable = true;
      nssmdns = true;
    };

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

    postgresql = {
      enable = true;
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
      libinput.enable = true;
      libinput.touchpad = {
        tappingDragLock = false;
        accelProfile = "flat";
        disableWhileTyping = true;
      };
      windowManager = {
        leftwm.enable = true;
        xmonad = {
          enable = true;
          enableContribAndExtras = true;
          extraPackages = haskellPackages: [
            haskellPackages.dbus
            haskellPackages.List
            haskellPackages.monad-logger
            haskellPackages.xmonad
          ];
        };
      };
      layout = "us,il";
      xkbOptions = "grp:alt_shift_toggle";
    };

  };
}
