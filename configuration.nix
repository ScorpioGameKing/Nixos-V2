{ config, lib, pkgs, ... }: 
{
  imports = [ 
      ./hardware-configuration.nix
    ];
  boot.loader.systemd-boot.enable = true;
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

  # services.pulseaudio.enable = true;
  # OR
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
  };

  programs.niri.enable = true;

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

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        ui = {
          smartcolumn.enable = true;
        };
        
        options = {
          cursorlineopt = "both";
          tabstop = 2;
          shiftwidth = 2;
          wrap = false;
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        binds.cheatsheet.enable = true;

        lsp.enable = true;
        languages = {
          enableTreesitter = true;
          lua.enable = true;
          nix.enable = true;
          python.enable = true;
        };

      };
    };
  };

  environment.systemPackages = with pkgs; [
    vim 
    wget
    brightnessctl
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.agave
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "26.05";
}

