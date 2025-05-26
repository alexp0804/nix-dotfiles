{
    description = "Nixos config flake";

    inputs = {
        # Nixpkgs
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

        # Home manager
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        # Darwin
        darwin = {
            url = "github:LnL7/nix-darwin";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        # Nixos hardware optimizations
        hardware.url = "github:nixos/nixos-hardware";

        # Mac-app util (for letting nix-configured Applications appear in spotlight)
        mac-app-util.url = "github:hraban/mac-app-util";
    };

    outputs = {
        self,
        nixpkgs,
        darwin,
        home-manager,
        mac-app-util,
        ...
        } @ inputs: let
            inherit (self) outputs;

            users = {
                alex = {
                    fullName = "Alexander Peterson";
                    name = "alex";
                };
            };

            # function to create nixos config
            mkNixosConfiguration = hostname: username:
                nixpkgs.lib.nixosSystem {
                    specialArgs = {
                        inherit inputs outputs hostname;
                        userConfig = users.${username};
                        nixosModules = "${self}/modules/nixos";
                    };
                    modules = [
                        ./hosts/${hostname}
                    ];
                };

            # function to create nix-darwin config
            mkDarwinConfiguration = hostname: username:
                darwin.lib.darwinSystem {
                    system = "aarch64-darwin";
                    specialArgs = {
                        inherit inputs outputs hostname;
                        userConfig = users.${username};
                        darwinModules = "${self}/modules/darwin";
                    };
                    modules = [
                        ./hosts/${hostname}
                        home-manager.darwinModules.home-manager
                        mac-app-util.darwinModules.default
                    ];
                };

            # function to create home-manager config
            mkHomeConfiguration = system: username: hostname:
                home-manager.lib.homeManagerConfiguration {
                    pkgs = import nixpkgs {inherit system;};
                    extraSpecialArgs = {
                        inherit inputs outputs hostname;
                        userConfig = users.${username};
                        nhModules = "${self}/modules/home-manager";
                    };
                    modules = [
                        ./users/${username}/${hostname}
                    ];
                };
        in {
            nixosConfigurations = {
                nixos-pc = mkNixosConfiguration "nixos-pc" "alex";
            };

            darwinConfigurations = {
                macbook = mkDarwinConfiguration "macbook" "alex";
            };

            homeConfigurations = {
                "alex@nixos-pc" = mkHomeConfiguration "x86_64-linux" "alex" "nixos-pc";
                "alex@macbook" = mkHomeConfiguration "aarch64-darwin" "alex" "macbook";
            };
        };
}
