# Home-manager configs for darwin systems
{ pkgs, ... }: {
    imports = [
        ./programs/aerospace
        ./programs/sketchybar
    ];

    home.packages = with pkgs; [ ];
}
