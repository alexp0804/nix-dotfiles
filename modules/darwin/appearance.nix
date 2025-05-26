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

            # dark mode
            NSGlobalDomain.AppleInterfaceStyle = "Dark";
        };
    };

}
