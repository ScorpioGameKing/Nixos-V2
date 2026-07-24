{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./modules/nixos/default.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 20;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixBox2";
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  services.printing.enable = true;
  services.playerctld.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "colormix";
      colormix_col1 = "0x00282828";
      colormix_col2 = "0x00504945";
      colormix_col3 = "0x00EBDBB2";
      clock = "%I %M %p";
      box_title = "Nix-Box";
    };
  };

  users.users.scorpio = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    autoEnable = true;
    targets = {
      nvf.enable = false;
    };
  };

  programs.niri.enable = true;
  programs.nm-applet.enable = true;
  programs.gamemode.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
  };

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  environment.systemPackages = with pkgs; [
    wget
    brightnessctl
    pavucontrol
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.agave
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "26.05";
}
