{ pkgs, ... }:
{
    system.defaults.NSGlobalDomain._HIHideMenuBar = true;

    services.sketchybar = {
        enable = true;
    };
}
