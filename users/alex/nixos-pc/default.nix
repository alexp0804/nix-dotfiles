{ nhModules, ... }:
{
    imports = [
        "${nhModules}/common-modules.nix"
        "${nhModules}/nixos-modules.nix"
    ];

    programs.home-manager.enable = true;

    home.stateVersion = "25.05";
}
