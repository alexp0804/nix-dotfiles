# /hosts/macbook/default.nix
# -- System-level configs for macbook
{
inputs,
hostname,
nhModules,
...
}: {
    imports = [
        ./hardware-configuration.nix
        "./${nhModules}/common-modules.nix"
        "./${nhModules}/darwin-modules.nix"
    ];

    nixpkgs.hostPlatform = "aarch64-darwin";

    homebrew = {
        enable = true;
        onActivation.cleanup = "uninstall";
        taps = [];
        brews = [];
        casks = [ "font-noto-sans-symbols-2" ];
    };

    networking.hostName = hostname;
    system.stateVersion = "25.05";
}
