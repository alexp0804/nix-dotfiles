# ~/.config/nix/flake.nix

{
    description = "macbook pro system config";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        nix-darwin = {
            url = "github:LnL7/nix-darwin/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        mac-app-util.url = "github:hraban/mac-app-util";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, mac-app-util }:
        let
            configuration = { pkgs, ... }: {
                nixpkgs.config.allowUnfree = true;
                nixpkgs.hostPlatform = "aarch64-darwin";
                programs.zsh.enable = true;

                environment.systemPackages = [
                    # essentials
                    pkgs.git
                    pkgs.tmux
                    pkgs.vim
                    pkgs.htop
                    pkgs.curl
                    pkgs.fzf
                    pkgs.tree

                    # gui apps
                    pkgs.iterm2
                    pkgs.spotify
                    pkgs.discord
                    pkgs.google-chrome
                    pkgs.obsidian

                    pkgs.zsh-vi-mode

                    # utils/dependencies
                    pkgs.ripgrep
                    pkgs.bc
                    pkgs.jq
                    pkgs.coreutils
                    pkgs.gawk
                    pkgs.gh
                    pkgs.glab
                    pkgs.gnused
                ];

                fonts.packages = [
                    pkgs.nerd-fonts.jetbrains-mono
                ];

                homebrew = {
                    onActivation.cleanup = "uninstall";
                    enable = true;
                    taps = [];
                    brews = [];
                    casks = [ "font-noto-sans-symbols-2" ];
                };

                nix.settings.experimental-features = "nix-command flakes";

                system.configurationRevision = self.rev or self.dirtyRev or null;

                # Used for backwards compatibility, please read the changelog before changing.
                # $ darwin-rebuild changelog
                system.stateVersion = 6;

                users.users.alex = {
                    name = "alex";
                    home = "/Users/alex";
                };
            };
        in
            {
            darwinConfigurations."macbook" = nix-darwin.lib.darwinSystem {
                modules = [
                    configuration
                    mac-app-util.darwinModules.default
                    home-manager.darwinModules.home-manager  {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.verbose = true;
                        home-manager.users.alex = import ./home.nix;
                    }
                    ./modules/mac-system
                ];
            };
        };
}
