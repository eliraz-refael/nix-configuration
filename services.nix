{ config, lib, pkgs, ... }:

{
  # services.system76-scheduler.enable = true;
  services.power-profiles-daemon.enable = true;
  security.rtkit.enable = true;
  # sound.enable = true; // deprecated
  services = {

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
      package = pkgs.postgresql_16;
    };

    displayManager.defaultSession = "hyprland";
    libinput.enable = true;

	   xserver = {
	enable = true;
	displayManager = {
		gdm = {
			enable = true;
			wayland = true;
		};


	};
desktopManager = {
	     gnome = {
	       enable = true;
	       # wayland = true;
	     };

};

	   };
    # displayManager = {
    #   sddm = {
    #     enable = true;
    #     wayland.enable = true;
    #   };
    # };
    # desktopManager = {
    #   plasma6 = {
    #     enable = true;
    #   };
    #   # gnome = {
    #   #   enable = true;
    #   #   wayland = true;
    #   # };
    # };

  };
}
