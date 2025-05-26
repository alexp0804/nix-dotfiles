{
pkgs,
userConfig,
...
}: {
    imports = [
        ./boot.nix
        ./i18n.nix
        ./display.nix
    ];

    nix = {
        settings = {
            experimental-features = "nix-command flakes";
            auto-optimise-store = true;
        };

        # garbage collect older than 2 weeks
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 14d";
        };
    };

    # Networking
    networking.networkmanager.enable = true;

    # User configuration
    users.users.${userConfig.name} = {
        description = userConfig.fullName;
        extraGroups = [ "networkmanager" "wheel" ];
        isNormalUser = true;
        shell = pkgs.zsh;
    };

    # Passwordless sudo
    security.sudo.wheelNeedsPassword = false;

    # System packages
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
        minimal-grub-theme
    ];

    # ZSH
    programs.zsh.enable = true;

    # additional services
    services.openssh.enable = true;
    services.locate.enable = true;
}
