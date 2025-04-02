{ pkgs, ... }:
{
    programs.git = {
        enable = true;
        userName = "Alex Peterson";
        userEmail = "for.alexpeterson@gmail.com";

        extraConfig = {
            pull.rebase = true;
            init.defaultBranch = "main";
        };
    };
}
