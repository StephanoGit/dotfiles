# rebuild command
# darwin-rebuild switch --flake ~/.config/nix#m4pro

{
  description = "Popos nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      nix-homebrew,
      home-manager,
    }:
    let
      configuration =
        { pkgs, config, ... }:
        {
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
                  "/Applications/Google Chrome.app"
                  "/System/Applications/Calendar.app"
                  "/Applications/Microsoft Outlook.app"
                  "/Applications/Microsoft Teams.app"
                  "/Applications/Spotify.app"
                ];
              };
              NSGlobalDomain._HIHideMenuBar = true;
              finder.FXPreferredViewStyle = "clmv";
            };
          };
          power = {
            sleep = {
              computer = "never";
              display = "never";
              harddisk = "never";
            };
          };

          homebrew = {
            enable = true;
            casks = [
              "ghostty"
              "betterdisplay"
              "google-chrome"
              "microsoft-teams"
              "microsoft-outlook"
              "spotify"
              "nikitabobko/tap/aerospace"
            ];
            onActivation.cleanup = "zap";
            onActivation.autoUpdate = true;
            onActivation.upgrade = true;
          };

          nixpkgs.config.allowUnfree = true;

          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          environment.systemPackages = [
            pkgs.vim
            pkgs.neovim
            pkgs.tmux
            pkgs.eza
            pkgs.direnv
            pkgs.imagemagick

            pkgs.jankyborders
          ];

          fonts = {
            packages = [
              pkgs.jetbrains-mono
              pkgs.nerd-fonts.jetbrains-mono
            ];
          };

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Enable alternative shell support in nix-darwin.
          # programs.fish.enable = false;

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 6;

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";

          users.users.stephano.home = "/Users/stephano";
          home-manager.backupFileExtension = "backup";
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#simple
      darwinConfigurations."m4pro" = nix-darwin.lib.darwinSystem {
        modules = [
          # this is used because direnv installation fails
          {
            nixpkgs.overlays = [
              (final: prev: {
                fish = prev.fish.overrideAttrs (old: {
                  doCheck = false;
                });
              })
            ];
          }

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

          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.stephano = import ./home.nix;
          }
          ../skhd/skhd.nix
          ../borders/borders.nix
          ../aerospace/aerospace.nix
        ];
      };

      darwinPackages = self.darwinConfigurations."m4pro".pkgs;
    };
}
