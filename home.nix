{ config, pkgs, ... }:
let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  dotfiles = "${config.home.homeDirectory}/repos/nixos-configs/dotfiles/nixos-dotfiles-repo/";
  configs = {
    fastfetch = "fastfetch";
    fuzzel = "fuzzel";
    niri = "niri";
    quickshell = "quickshell";
    swaylock = "swaylock";
    waybar = "waybar";
    wezterm = "wezterm";
    yazi = "yazi";
  };
in
{

  home.username = "scorpio";
  home.homeDirectory = "/home/scorpio";
  home.stateVersion = "26.05";

  programs.git.enable = true;
  programs.ripgrep.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "I use NixOS, btw";
      ff = "clear && fastfetch";
      lg = "lazygit";
      qnrb = "sudo lg && nixos-rebuild switch --flake ~/repos/nixos-configs#nixBox2";
    };
    initExtra = ''
      ff
    '';
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

  programs.yazi = {
    enable = true;
    settings = {
      manager = { 
        linemode = "relative";
        show_hidden = true;
      };
    };
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

  programs.alacritty.enable = true;
  programs.wezterm.enable = true;
  programs.fuzzel.enable = true;
  programs.swaylock.enable = true;
  programs.waybar.enable = true;

  programs.firefox.enable = true;
  programs.brave.enable = true;

  services.mako.enable = true;
  services.swayidle.enable = true;
  services.polkit-gnome.enable = true;

  home.packages = with pkgs; [
    swaybg
    xwayland-satellite
  ];

  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;
}
