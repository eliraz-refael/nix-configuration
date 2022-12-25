{ config, lib, pkgs, ... }:

{
  # Set your time zone.
  time.timeZone = "Asia/Jerusalem";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IL.UTF-8";
  i18n.extraLocaleSettings = { LC_TIME = "en_IL.UTF-8"; LC_ALL = "en_IL.UTF-8"; };
  i18n.supportedLocales = ["en_IL/UTF-8" "en_US.UTF-8/UTF-8"];
}
