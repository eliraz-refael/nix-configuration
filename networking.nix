{ config, lib, pkgs, ... }:

{
  networking.hostName = "eliraz-system76"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.powersave = false; # false means disable
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];
  networking.firewall = {
    enable = true;
    trustedInterfaces = [ "lo" "lxdbr0" ];
    extraCommands = ''
      iptables -A INPUT -i lxdbr0 -j ACCEPT
      iptables -A OUTPUT -o lxdbr0 -j ACCEPT
      iptables -A FORWARD -i lxdbr0 -j ACCEPT
      iptables -A FORWARD -o lxdbr0 -j ACCEPT
    '';
  };
  networking.extraHosts =
    ''
    127.0.0.1 fg-kafka-kafka-0.fg-kafka-kafka-brokers.kafka.svc
  '';
}
