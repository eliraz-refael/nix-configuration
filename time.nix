{ config, lib, pkgs, ... }:

{
  # Set your time zone.
  time.timeZone = "Asia/Jerusalem";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IL.utf8";
  i18n.extraLocaleSettings = { LC_TIME = "en_IL.utf8"; LC_ALL = "en_IL.utf8"; };
}
