# Home-manager configs for every system
{ pkgs, userConfig, ... }:
{
    imports = [
        ./programs/bat
        ./programs/eza
        ./programs/firefox
        ./programs/git
        ./programs/nvim
        ./programs/ssh
        ./programs/tmux
        ./programs/wezterm
        ./programs/zoxide
        ./programs/zsh
    ];

    nixpkgs.config.allowUnfree = true;

    systemd.user.startServices = "sd-switch";

    home = {
        username = "${userConfig.name}";
        homeDirectory =
            if pkgs.stdenv.isDarwin
                then "/Users/${userConfig.name}"
            else "/home/${userConfig.name}";
    };

    home.packages = with pkgs; [
        discord
        google-chrome
        spotify
    ];
}
