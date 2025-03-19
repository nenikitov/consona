# Consona

Nix helper that applies a unified theme to all applications.

## Installation

1. Make sure you set up [home-manager](https://github.com/nix-community/home-manager)
2. Add to your `flake.nix`
    ```nix
    {
      inputs = {
        # ...
        consona = {
          url = "github:nenikitov/consona"
          inputs.nixpkgs.follows = "nixpkgs"
        };
      };
      outputs = {home-manager, ...} @ inputs: {
        homeConfiguratoins."USERNAME" = home-manager.lib.homeManagerConfiguration {
          # ...
          modules = [
            # ...
            inputs.consona.homeManagerModule
          ];
        };
      };
    }
    ```

## Creating a new module

Here is an example module that can be followed as a template
```nix
args: let
  libConsona = import ../../lib args;
  inherit (libConsona) mkTarget palette;
  inherit (libConsona.transform) hex;
in
  mkTarget {
    name = "alacritty";
    nameHuman = "Alacritty";
    cfg = {
      programs.alacritty.settings.colors.primary.background = hex palette.bg;
      };
    };
  }
```

## Usage

1. Configure a theme
    <!-- TODO -->
2. Select which apps to style
    <!-- TODO -->
3. If an app is not supported by Consona, you can manually access colors with
    <!-- TODO -->
    ```nix
    {inputs, ...}@args: {
      programs.some-program.settings = {
        accent = config.lib.consona.ansiToHex "red";
      }
    }
    ```
