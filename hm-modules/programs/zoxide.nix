# super useful for navigating directories.
# remembers directories you've been to recently and lets you fuzzy find its name.
# e.g. `z darwin` might take you to ~/.config/nix/hm-modules/darwin`
{ pkgs, ... }:
{
    programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
    };
}
