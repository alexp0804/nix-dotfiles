{ pkgs, ... }:
{
    # Remember to hide menu bar if sketchybar is turned on
    system.defaults.NSGlobalDomain._HIHideMenuBar = false;

    services.sketchybar = {
        enable = false;
    };
}
