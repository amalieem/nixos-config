{ pkgs, lib, inputs, config, ... }: {
  programs = {
    zsh = {
      enable = true;
      history.extended = true;

      prezto = {
        enable = true;
        editor = {
          keymap = "emacs";
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
          # "syntax-highlighting"
          "prompt"
        ];
      };

      initExtra = ''
        # Autocomplete ../
        # zstyle ':completion:*' special-dirs true
      '';

      shellAliases = {
        g = "git";
        gst = "git status -sb";
      };
    };
  };
}

