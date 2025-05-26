# Home-manager configs for nixOS systems
{ pkgs, ... }:
{
    imports = [
        ./programs/hyprland
    ];

    home.packages = with pkgs; [
        pulseaudio
    ];
}
