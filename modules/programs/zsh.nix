{ pkgs, ... }:
{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting = {
            enable = true;
        };
        shellAliases = {
            switch = "darwin-rebuild switch --flake ~/.config/nix";
        };
    };
}
