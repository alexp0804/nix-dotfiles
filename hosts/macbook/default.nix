# /hosts/macbook/default.nix
# -- System-level configs for macbook
{
inputs,
hostname,
darwinModules,
...
}: {
    imports = [
        ../../modules/system-packages.nix
        ./hardware-configuration.nix
        "${darwinModules}"
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
