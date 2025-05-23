# git.
# defines user config, fancy diff outputs, some default behaviors
{ pkgs, ... }:
{
    programs.git = {
        enable = true;

        userName = "Alex Peterson";
        userEmail = "for.alexpeterson@gmail.com";

        ignores = [
            "*.swp"
            ".DS_Store"
        ];

        diff-so-fancy = {
            enable = true;
            markEmptyLines = false;
            stripLeadingSymbols = false;
        };

        extraConfig = {
            core.whitespace = "error";
            pull.rebase = true;
            init.defaultBranch = "main";

            status = {
                branch = true;
                short = true;
                showStash = true;
                showUntrackedFiles = "all";
            };
        };
    };
}
