{ config, pkgs, ... }:
let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  dotfiles = "${config.home.homeDirectory}/repos/nixos-configs/nixos-dotfiles-repo";
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
    wezterm.enable = false;
  };

  programs.ripgrep.enable = true;
  programs.fastfetch.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "I use NixOS, btw";
      ff = "clear && fastfetch";
      lg = "lazygit";
      ls = "eza -TF -L 1 -a -s type --icons=auto -lUmh --git-repos --no-permissions";
      qnc = "nix-collect-garbage -d";
      qnu = "nix flake update --flake ~/repos/nixos-configs";
      qnrb = "cd ~/repos/nixos-configs && lg && sudo nixos-rebuild switch --flake ~/repos/nixos-configs#nixBox2";
      qnrbd = "cd ~/repos/nixos-configs && qnu && lg && sudo nixos-rebuild switch --flake ~/repos/nixos-configs#nixBox2";
      qnrbf = "cd ~/repos/nixos-configs && qnu && lg && sudo nixos-rebuild switch --flake ~/repos/nixos-configs#nixBox2 && qnc";
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

  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = true;
    useTheme = "gruvbox";
  };

  programs.nom = {
    enable = true;
    settings = {
      database = "main.db";
      autoread = true;
      showread = true;
      feeds = [
        # {
        #   name = "r/Unixporn";
        #   url = "https://www.reddit.com/r/Unixporn/.rss";
        # }
        # {
        #   name = "r/Nixos";
        #   url = "https://www.reddit.com/r/NixOS/.rss";
        # }
        {
          name = "yt/Vimjoyer";
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=https://www.youtube.com/@vimjoyer";
        }
      ];
      openers = [
        {
          cmd = "mpv %s";
          regeex = "youtube";
        }
      ];
    };
  };
  programs.yazi.enable = true;
  programs.wezterm.enable = true;
  programs.fuzzel.enable = true;
  programs.swaylock.enable = true;
  programs.waybar.enable = true;
  programs.btop.enable = true;

  programs.brave.enable = true;
  programs.equibop.enable = true;

  services.mako.enable = true;
  services.swayidle.enable = true;

  programs.gpg.enable = true;
    services.gpg-agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-all;
    };

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
      source = create_symlink "${dotfiles}/wallpapers";
      recursive = true;
    };
  };
}
