{ inputs, pkgs, ... }: {

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

  services.udev.extraHwdb = ''
    evdev:atkbd:*
      KEYBOARD_KEY_3a=esc
  '';

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

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  environment.systemPackages = with pkgs; [
    wget
    brightnessctl
    pavucontrol
    inputs.self.packages.${pkgs.stdenv.hostPlatform.system}.nvim
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
