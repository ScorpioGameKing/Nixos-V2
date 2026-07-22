{ config, pkgs, ... }:
let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  dotfiles = "${config.home.homeDirectory}/repos/nixos-configs/dotfiles/nixos-dotfiles-repo";
  configs = {
    fastfetch = "fastfetch";
    fuzzel = "fuzzel";
    niri = "niri";
    quickshell = "quickshell";
    swaylock = "swaylock";
    waybar = "waybar";
    waypaper = "waypaper";
    wezterm = "wezterm";
    yazi = "yazi";
  };
in
{

  home.username = "scorpio";
  home.homeDirectory = "/home/scorpio";
  home.stateVersion = "26.05";

  stylix.targets = {
    swaylock.enable = false;
    yazi.enable = false;
    waybar.enable = false;
    fuzzel.enable = false;
  };

  programs.ripgrep.enable = true;
  programs.fastfetch.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "I use NixOS, btw";
      ff = "clear && fastfetch";
      lg = "lazygit";
      qnrb = "cd ~/repos/nixos-configs && lg && sudo nixos-rebuild switch --flake ~/repos/nixos-configs#nixBox2";
    };
    initExtra = ''
      ff
    '';
  };

  programs.git = {
    enable = true;
    userName = "ScorpioGameKing";
    userEmail = "scorpiogameking@gmail.com";
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };

  programs.lazygit = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    options = [ "--cmd cd" ];
  };

  programs.eza = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.yazi.enable = true;
  programs.alacritty.enable = true;
  programs.wezterm.enable = true;
  programs.fuzzel.enable = true;
  programs.swaylock.enable = true;
  programs.waybar.enable = true;

  programs.firefox.enable = true;
  programs.brave.enable = true;
  programs.equibop.enable = true;

  services.mako.enable = true;
  services.swayidle.enable = true;
  services.polkit-gnome.enable = true;

  home.packages = with pkgs; [
    swaybg
    waypaper
    xwayland-satellite
  ];

  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/.config/${subpath}";
      recursive = true;
    })
    configs;
  home.file = {
    "Pictures/wallpapers" = {
      source = create_symlink "${dotfiles}/gruvbox-wallpapers/wallpapers";
      recursive = true;
    };
  };
}
