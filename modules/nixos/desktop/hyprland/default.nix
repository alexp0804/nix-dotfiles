{pkgs, ...}: {
    # enables support for bluetooth
    hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
    };
    # enable bluetooth support
    services.blueman.enable = true;

    programs.hyprland.enable = true;

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        XCURSOR_SIZE = "24";
    };

    environment.systemPackages = with pkgs; [
        kitty # required!
        wl-clipboard
    ];
}
