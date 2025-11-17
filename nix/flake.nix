# rebuild command
# darwin-rebuild switch --flake ~/.config/nix#m4pro

{
  description = "Popos nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";  
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
  let
    configuration = { pkgs, config, ... }: {
     
     	system = {
	  primaryUser = "stephano";
	  defaults = {
		dock = {
			autohide = true;
			autohide-delay = 0.01;
			autohide-time-modifier = 1.0;
			orientation = "left";
			persistent-apps = [
				"/Applications/Ghostty.app"
				"/System/Applications/Calendar.app"
			];
		};
		finder.FXPreferredViewStyle = "clmv";
	  };
	};
        
	homebrew = {
          enable = true;
          casks = [ "ghostty"
	  	"betterdisplay"];
          onActivation.cleanup = "zap";
          onActivation.autoUpdate = true;
          onActivation.upgrade = true;
        };



      nixpkgs.config.allowUnfree = true;

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
	pkgs.vim
	pkgs.neovim
        pkgs.tmux
	pkgs.nerd-fonts.jetbrains-mono
	];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."m4pro" = nix-darwin.lib.darwinSystem {
      modules = [ 
      	configuration 
	nix-homebrew.darwinModules.nix-homebrew
        {
            nix-homebrew = {
              # Install Homebrew under the default prefix
              enable = true;

              # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
              enableRosetta = true;

              # User owning the Homebrew prefix
              user = "stephano";
            };
          }
	../zsh/zsh.nix
      ];
    };
    
    darwinPackages = self.darwinConfigurations."m4pro".pkgs;
  };
}
