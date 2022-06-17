# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      <nixos-hardware/asus/zephyrus/ga503>
      ./home.nix
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "eliraz-nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Jerusalem";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IL.utf8";
  i18n.extraLocaleSettings = { LC_TIME = "en_IL.utf8"; LC_ALL = "en_IL.utf8"; };

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    displayManager = {
      gdm.enable = true;
      defaultSession = "xfce";
    };
    desktopManager = {
      xfce = {
        enable = true;
      };
    };
    windowManager.i3.enable = true;
    windowManager.leftwm.enable = true;
    layout = "us,il";
    xkbVariant = "";
    xkbOptions = "grp:alt_shift_toggle";
  };

  services.blueman.enable = true;

  fonts.fonts = with pkgs; [
    iosevka
    culmus
    nerdfonts
  ];


  # Enable CUPS to print documents.
  services.printing.enable = true;

  hardware.nvidia.prime = {
    amdgpuBusId = pkgs.lib.mkOverride 0 "PCI:6:0:0";
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.bluetooth.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.opengl.enable = true;
  hardware.nvidia.modesetting.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
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

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.eliraz = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Eliraz Kedmi";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    firefox
    git
    emacs
    kitty
    alacritty
    dmenu
    rofi
    nitrogen
    fd
    ripgrep
    nerdfonts
    polybar
    picom
    conky
    feh
    arandr
    autorandr
    libxkbcommon
    openssl
    signal-desktop
    yarn
    nodejs
    nodePackages.npm
    unzip
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leavecatenate(variables, "bootdev", bootdev)
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
