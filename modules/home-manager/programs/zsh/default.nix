{ pkgs, userConfig, hostname, lib, ... }:
{
    programs.zsh = {
        enable = true;
        defaultKeymap = "viins";
        autosuggestion.enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;
        dotDir = ".config/zsh";

        shellAliases = {
            all-switch = "nix-switch && home-switch";
            nix-switch = lib.strings.concatStrings [
                "sudo "
                (if pkgs.stdenv.isDarwin then "darwin" else "nixos")
                "-rebuild switch --flake ~/.config/nix#${hostname}"
            ];
            home-switch = "home-manager switch --flake ~/.config/nix#${userConfig.name}@${hostname}";
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
