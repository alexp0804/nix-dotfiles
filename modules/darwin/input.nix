{ ... }: {
    system.defaults = {
        # don't show emoji tooltib with fn is pressed
        hitoolbox.AppleFnUsageType = "Do Nothing";

        # natural scrolling direction
        NSGlobalDomain."com.apple.swipescrolldirection" = false;

        # disable auto capitalization
        NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;
    };

    system.keyboard = {
        enableKeyMapping = true;
        swapLeftCtrlAndFn = true;
        remapCapsLockToEscape = true;
    };
}
