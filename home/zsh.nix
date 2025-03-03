{ pkgs, lib, inputs, config, ... }: {
  programs = {
    zsh = {
      enable = true;
      history.extended = true;

      prezto = {
        enable = true;
        editor = {
          keymap = "vi";
          dotExpansion = true;
        };
        prompt = {
          theme = "agnoster";
          # pwdLength = "long";
          # showReturnVal = true;
        };
        # terminal.autoTitle = true;

        pmodules = [
          "environment"
          "terminal"
          "editor"
          "history"
          "directory"
          "spectrum"
          "history-substring-search"
          # "git"
          "autosuggestions"
          "syntax-highlighting"
          "prompt"
        ];
      };

      initExtra = ''
      '';

      shellAliases = {
        g = "git";
        gst = "git status -sb";
        sp = "nix-shell --run zsh -p";
      };
    };
  };
}

