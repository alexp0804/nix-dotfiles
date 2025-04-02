{ pkgs, ... }:
{
    system = {
        defaults = {
            controlcenter = {
                BatteryShowPercentage = true;
                Bluetooth = true;
                Display = true;
                Sound = true;
            };

            # don't show emoji tooltip when fn pressed
            hitoolbox.AppleFnUsageType = "Do Nothing";

            # dark mode
            NSGlobalDomain.AppleInterfaceStyle = "Dark";

            # natural scrolling direction
            NSGlobalDomain."com.apple.swipescrolldirection" = false;
        };
        keyboard = {
            enableKeyMapping = true;
            swapLeftCtrlAndFn = true;
            remapCapsLockToEscape = true;
        };
    };

    # use touchId instead of password
    security.pam.services.sudo_local.touchIdAuth = true;

    # this allows touchId to be used inside tmux sessions
    environment = {
        etc."pam.d/sudo_local".text = ''
                    # Managed by Nix Darwin
                    auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so ignore_ssh
                    auth       sufficient     pam_tid.so
        '';
    };
}
