{ pkgs, ... }:
{
    programs.eza = {
        enable = true;
        colors = "auto";
        enableZshIntegration = true;
        extraOptions = [
            "--group-directories-first"
            "-A"
        ];
        icons = "auto";
        git = true;
    };
}
