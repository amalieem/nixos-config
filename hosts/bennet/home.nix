{ pkgs, lib, ... }:

{
  imports = [
    ./../../home/base.nix
    ./../../home/alacritty.nix
  ];

  home.packages = with pkgs; [
    # GUI Applications
    chromium
    element-desktop
    pavucontrol

    # Window Manager Extras
    bibata-cursors
    hyprcursor
    hypridle
    hyprlock
    hyprpaper
    hyprshot
    nautilus
    swaynotificationcenter
    waybar
    wl-clipboard

    # Misc.
    bottom
    neofetch
    hunspellDicts.en_US
    hunspellDicts.nb_NO
  ];

  programs = {
    alacritty = {
      enable = true;
    };
    firefox.enable = true;
    rofi = {
      enable = true;
      theme = "Arc-Dark";
      package = pkgs.rofi-wayland;
    };
    zsh = {
      shellAliases."rebuild" = "sudo nixos-rebuild switch --flake /home/amalieem/nixos-config";
    };
  };

  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
    gtk.enable = true;
    x11 = {
      enable = true;
      defaultCursor = true;
    };
  };

  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
      "application/pdf" = "firefox.desktop";

      "inode/directory" = "org.gnome.Nautilus.desktop";

    } // builtins.listToAttrs (
      builtins.map
        ( imgType: { name = "image/${imgType}"; value = "firefox.desktop"; } )
        [ "apng" "bmp" "gif" "heic" "heif" "jpeg" "png" "svg" "svg+xml" "tiff" ]
    );
  };

  home.stateVersion = "24.11";
}

