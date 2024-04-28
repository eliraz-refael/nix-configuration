{ config, lib, pkgs, ... }:

{
  services.system76-scheduler.enable = true;
  security.rtkit.enable = true;
  sound.enable = true;
  services = {
    auto-cpufreq.enable = true;
    auto-cpufreq.settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
    thermald.enable = true;

#    blueman.enable = true;

    # Enable CUPS to print documents.
    printing = {
      enable = true;
      drivers = [pkgs.hplip];
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
      videoDrivers = ["nvidia"];
      displayManager = {
        gdm = {
          enable = true;
          wayland = true;
        };
        defaultSession = "none+qtile";
      };
      desktopManager = {
        gnome = {
          enable = true;
        };
      };
      libinput.enable = true;
      windowManager = {
        qtile = {
          enable = true;
          backend = "wayland";
          extraPackages = python3Packages: with python3Packages; [
            pywlroots
          ];
        };
      };
      layout = "us,il";
      xkbOptions = "grp:alt_shift_toggle";
    };

  };
}
