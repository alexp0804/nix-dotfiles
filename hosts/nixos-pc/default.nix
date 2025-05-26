# /hosts/nixos-pc/default.nix
# -- System-level configs for nixos-pc
{
inputs,
hostname,
nixosModules,
...
}: {
    imports = [
        inputs.hardware.nixosModules.common-gpu-nvidia
        inputs.hardware.nixosModules.common-cpu-intel
        inputs.hardware.nixosModules.common-pc-ssd

        ./hardware-configuration.nix
        ../../modules/system-packages.nix
        "${nixosModules}"
        "${nixosModules}/desktop/hyprland"
    ];

    hardware.nvidia = {
        modesetting.enable = true;

        powerManagement = {
            enable = true;
            finegrained = true;
        };

        open = true;
        nvidiaSettings = true;

        prime = {
            # can obtain these by running `sudo lshw -c display` and looking at the "bus info" entry for the hex id.
            # enter here as decimal, not hex
            intelBusId = "PCI:0:0:2";
            nvidiaBusId = "PCI:0:1:0";
        };
    };

    networking.hostName = hostname;
    system.stateVersion = "25.05";
}
