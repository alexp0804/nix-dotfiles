# the zshell
{ pkgs, ... }:
{
    programs.zsh = {
        enable = true;
        defaultKeymap = "viins";
        autosuggestion.enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;
        dotDir = ".config/zsh";

        shellAliases = {
            switch = "sudo darwin-rebuild switch --flake ~/.config/nix";
            tree = "lt";
        };

        history = {
            size = 10000;
            save = 10000;
        };

        oh-my-zsh = {
            enable = true;
            plugins = [
                "git"
                "colored-man-pages"
            ];
            theme = "bureau";
        };

        plugins = [
            {
                name = "vi-mode";
                src = pkgs.zsh-vi-mode;
                file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
            }
        ];
    };
}
