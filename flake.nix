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
      	pkgs.git
	pkgs.tmux
  	  pkgs.vim
	  pkgs.htop
	  pkgs.curl
	  pkgs.firefox
	  pkgs.iterm2
	  pkgs.spotify
	  pkgs.discord
	  pkgs.obsidian
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
	  pkgs.nerd-fonts.fira-code
	  pkgs.open-sans
	  pkgs.notonoto
	];

      homebrew = {
        onActivation.cleanup = "uninstall";
        enable = true;
	    taps = [];
	    brews = [ "nowplaying-cli" ];
	    casks = [ "alfred" "font-noto-sans-symbols-2" ];
	};

	services = {
		yabai.enable = true;
		skhd = {
			enable = true;
			skhdConfig = "
				# Navigation
alt - h : yabai -m window --focus west || yabai -m display --focus west
alt - j : yabai -m window --focus south || yabai -m display --focus south
alt - k : yabai -m window --focus north || yabai -m display --focus north
alt - l : yabai -m window --focus east || yabai -m display --focus east

# Moving windows
shift + alt - h : yabai -m window --warp west
shift + alt - j : yabai -m window --warp south
shift + alt - k : yabai -m window --warp north
shift + alt - l : yabai -m window --warp east

# Move focus container to workspace
shift + alt - 1 : yabai -m window --space 1
shift + alt - 2 : yabai -m window --space 2
shift + alt - 3 : yabai -m window --space 3
shift + alt - 4 : yabai -m window --space 4
shift + alt - 5 : yabai -m window --space 5

# Resize windows
ctrl + shift - h : \\
    yabai -m window --resize left:-100:0 ; \\
    yabai -m window --resize right:-100:0

ctrl + shift - j : \\
    yabai -m window --resize bottom:0:100 ; \\
    yabai -m window --resize top:0:100

ctrl + shift - k : \\
    yabai -m window --resize top:0:-100 ; \\
    yabai -m window --resize bottom:0:-100

ctrl + shift - l : \\
    yabai -m window --resize right:100:0 ; \\
    yabai -m window --resize left:100:0

# Rotate windows
alt - r : yabai -m space --rotate 270
shift + alt - r: yabai -m space --rotate 90

# Float and center window
shift + alt - c : yabai -m window --toggle float;\\
                yabai -m window --grid 4:4:1:1:2:2

# Float / Unfloat window
shift + alt - space : yabai -m window --toggle float

# Make fullscreen
alt - f : yabai -m window --toggle zoom-fullscreen

# Change desktop
ctrl - 1 : yabai -m space --focus 1
ctrl - 2 : yabai -m space --focus 2
ctrl - 3 : yabai -m space --focus 3
ctrl - 4 : yabai -m space --focus 4
ctrl - 5 : yabai -m space --focus 5
			";
		};
	};

      nix.settings.experimental-features = "nix-command flakes";

      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # Declare the user that will be running `nix-darwin`.
      users.users.alex = {
        name = "alex";
        home = "/Users/alex";
      };

      system = {
      	defaults = {
	      dock = {
		      persistent-apps = [
		      {
			      spacer = {
				      small = true;
			      };
		      }
		      {
			      app = "/Applications/Safari.app";
		      }
		      {
			      app = "/System/Applications/System Settings.app";
		      }
		      ];

		      autohide = true;
		      minimize-to-application = true; # apps minimize into their icon instead of separate section
		      mru-spaces = false; # disable rearranging spaces based on most recent use
		      show-recents = false;
		      tilesize = 64;

		      wvous-tl-corner = 4; # top left corner action is show desktop
	      };

	      finder = {
	      	AppleShowAllFiles = true;	
		FXDefaultSearchScope = "SCcf"; # when seaching, use current folder
		FXEnableExtensionChangeWarning = false;
		FXPreferredViewStyle = "Nlsv"; # default view is List View
		NewWindowTarget = "Home";
		ShowPathbar = true;
		_FXSortFoldersFirst = true;
	      };

		controlcenter = {
			BatteryShowPercentage = true;
			Bluetooth = true;
			Display = true;
			Sound = true;
		};

		# don't show emoji tooltip when fn pressed
		hitoolbox.AppleFnUsageType = "Do Nothing";
	
	      NSGlobalDomain.AppleInterfaceStyle = "Dark";
	      NSGlobalDomain."com.apple.swipescrolldirection" = false;
	};
	      keyboard = {
	      	enableKeyMapping = true;
	      	swapLeftCtrlAndFn = true;
		remapCapsLockToEscape = true;
	      };
      };

      security.pam.services.sudo_local.touchIdAuth = true;
      # this allows touchId to be used inside tmux sessions
      environment = {
	      etc."pam.d/sudo_local".text = ''
# Managed by Nix Darwin
		      auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so ignore_ssh
		      auth       sufficient     pam_tid.so
		      '';	
      };
    };
    homeconfig = {pkgs, ...}: {
	programs.home-manager.enable = true;
	home.stateVersion = "23.05";

    	home.username = "alex";
	home.homeDirectory = "/Users/alex";

	home.packages = [
	];


	# zsh		-- shell
	# tmux		-- terminal multiplexer
	# nvim		-- text editor
	# git		-- source control
	# iterm2	-- terminal emulator

	# skhd 		-- hotkeys

	# firefox	-- web browser
	# obsidian	-- note taking
	# spotify 	-- music
	# discord	-- chat

	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting = {
			enable = true;
		};
		shellAliases = {
			switch = "darwin-rebuild switch --flake ~/.config/nix";
		};
	};	

	programs.tmux = {
		enable = true;
		baseIndex = 1;
		mouse = true;
		prefix = "C-a";
		terminal = "screen-256color";
		keyMode = "vi";
		plugins = [
			pkgs.tmuxPlugins.sensible
			pkgs.tmuxPlugins.vim-tmux-navigator
			pkgs.tmuxPlugins.yank
			pkgs.tmuxPlugins.tokyo-night-tmux
			pkgs.tmuxPlugins.pain-control
		];
		historyLimit = 10000;
		extraConfig = "
			# renumber windows when another window is closed
			set -g renumber-windows on

			# rename window to current program
			setw -g automatic-rename on

			set -g default-command ${pkgs.zsh}/bin/zsh
		";
	};

	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;
	};

	programs.git = {
		enable = true;
		userName = "Alex Peterson";
		userEmail = "for.alexpeterson@gmail.com";

		extraConfig = {
			pull.rebase = true;
			init.defaultBranch = "main";
		};
	};

	programs.firefox = {
		enable = true;
	};
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#macbook
    darwinConfigurations."macbook" = nix-darwin.lib.darwinSystem {
      modules = [
      	configuration 
	mac-app-util.darwinModules.default
	home-manager.darwinModules.home-manager  {
		home-manager.useGlobalPkgs = true;
		home-manager.useUserPackages = true;
		home-manager.verbose = true;
		home-manager.users.alex = homeconfig;
        }
      ];
    };
  };
}
