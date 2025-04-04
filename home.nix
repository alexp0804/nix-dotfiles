#s ~/.config/nix/home.nix

{ config, pkgs, inputs, ...}: {
    imports = [
        ./modules/programs/zsh.nix
        ./modules/programs/tmux.nix
        ./modules/programs/nvim/nvim.nix
        ./modules/programs/git.nix
        ./modules/programs/ssh.nix
        ./modules/programs/eza.nix
    ];

    home.username = "alex";
    home.homeDirectory = "/Users/alex";
    home.stateVersion = "23.05";

    home.packages = [];

    programs.home-manager.enable = true;
}
