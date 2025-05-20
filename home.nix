#s ~/.config/nix/home.nix

{ config, pkgs, inputs, ...}: {
    imports = [
        ./hm-modules/programs
    ];

    home.username = "alex";
    home.homeDirectory = "/Users/alex";
    home.stateVersion = "23.05";

    home.packages = with pkgs; [ ];

    programs.home-manager.enable = true;
}
