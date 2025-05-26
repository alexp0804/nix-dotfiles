{ pkgs, ... }: {
    boot = {
        # Use latest kernel
        kernelPackages = pkgs.linuxPackages_latest;

        kernelParams = [ "quiet" "splash" ];
        plymouth.enable = true;

        # Use GRUB boot loader
        loader = {
            systemd-boot.enable = false;
            efi.canTouchEfiVariables = true;

            grub = {
                enable = true;
                useOSProber = true;
                efiSupport = true;
                devices = [ "nodev" ];
                default = "saved"; # default selection should be whatever was selected last
                theme = pkgs.minimal-grub-theme;
            };
        };
    };

    # These services affect the boot time - disabling for faster boot
    systemd.services = {
        NetworkManager-wait-online.enable = false;
        plymouth-quit-wait.enable = false;
    };
}
