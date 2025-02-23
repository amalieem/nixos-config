{ pkgs, lib, inputs, config, ...}:
{
  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        TERM = "xterm-256color";
      };

      window = {
        padding = {
          x = 8;
          y = 2;
        };

        dynamic_padding = true;
        dynamic_title = true;

        decorations = "none"; # full/none/transparent/buttonless

        opacity = 0.95;
      };

      scrolling = {
        history = 9999;
        multiplier = 3;
      };

      # Font configuration (changes require restart)
      font = {
        normal = {
          family = "Hack Nerd Font Mono";
          style = "Regular";
        };

        bold = {
          family = "Hack Nerd Font Mono";
          style = "Bold";
        };

        italic = {
          family = "Hack Nerd Font Mono";
          style = "Italic";
        };

        size = 14;
      };


      colors = {
        draw_bold_text_with_bright_colors = true;

        # Nord:
        primary = {
          background = "0x2e3440";
          foreground = "0xd8dee9";
          dim_foreground = "0xa5abb6";
        };

        cursor = {
          text = "0x2e3440";
          cursor = "0xd8dee9";
        };

        vi_mode_cursor = {
          text = "0x2e3440";
          cursor = "0xd8dee9";
        };

        selection = {
          text = "CellForeground";
          background = "0x4c566a";
        };

        normal = {
          black   = "0x3b4252";
          red     = "0xbf616a";
          green   = "0xa3be8c";
          yellow  = "0xebcb8b";
          blue    = "0x81a1c1";
          magenta = "0xb48ead";
          cyan    = "0x88c0d0";
          white   = "0xe5e9f0";
        };

        bright = {
          black   = "0x4c566a";
          red     = "0xbf616a";
          green   = "0xa3be8c";
          yellow  = "0xebcb8b";
          blue    = "0x81a1c1";
          magenta = "0xb48ead";
          cyan    = "0x8fbcbb";
          white   = "0xeceff4";
        };

        dim = {
          black   = "0x373e4d";
          red     = "0x94545d";
          green   = "0x809575";
          yellow  = "0xb29e75";
          blue    = "0x68809a";
          magenta = "0x8c738c";
          cyan    = "0x6d96a5";
          white   = "0xaeb3bb";
        };
      };

      #bell = {
      #  animation = "Ease";
      #  color = "0xffffff";
      #  duration = 100;
      #};

      selection = {
        semantic_escape_chars = ",│`|:\"' ()[]{}<>";
        save_to_clipboard = false;
      };

      cursor = {
        style = {
          shape = "Block";
          blinking = "on";
        };
        unfocused_hollow = true;
      };

    };
  };
}

