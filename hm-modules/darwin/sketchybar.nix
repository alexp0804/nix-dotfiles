{ pkgs, ... }:
{
    system.defaults.NSGlobalDomain._HIHideMenuBar = false;

    services.sketchybar = {
        enable = false;
    };
}
