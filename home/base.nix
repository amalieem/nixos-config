{ pkgs, lib, ... }:
{
  imports = [
    #./neovim.nix
    ./zsh.nix
  ];

  home = {
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.git = {
    enable = true;

    extraConfig = {
      pull.rebase = true;
      push.autoSetupRemote = true;
      color.ui = "auto";
      init.defaultBranch = "main";

      user = {
        name = "Amalie Mansaker";
        email = "amalie.mansaker@gmail.com";
      };
    };
    ignores = [
      "*~"
      "*.swp"
      ".DS_Store"
      ".vscode"
    ];
  };
}

