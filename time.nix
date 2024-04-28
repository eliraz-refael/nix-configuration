{ config, lib, pkgs, ... }:

{
  # Set your time zone.
  time.timeZone = "Asia/Jerusalem";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IL.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ALL = "en_IL.UTF-8";
    LC_ADDRESS = "en_IL.UTF-8";
    LC_IDENTIFICATION = "en_IL.UTF-8";
    LC_MEASUREMENT = "en_IL.UTF-8";
    LC_MONETARY = "en_IL.UTF-8";
    LC_NAME = "en_IL.UTF-8";
    LC_NUMERIC = "en_IL.UTF-8";
    LC_PAPER = "en_IL.UTF-8";
    LC_TELEPHONE = "en_IL.UTF-8";
    LC_TIME = "en_IL.UTF-8";
  };
  i18n.supportedLocales = ["en_IL/UTF-8" "en_US.UTF-8/UTF-8"];
}
