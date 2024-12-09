# adaptive-styler

## Installation

1. Make sure you set up [home-manager](https://github.com/nix-community/home-manager)
2. Add to your `flake.nix`
    ```nix
    {
      inputs = {
        # ...
        styler = {
          url = "github:nenikitov/adaptive-styler"
          inputs.nixpkgs.follows = "nixpkgs"
        };
      };
      outputs = {home-manager, ...} @ inputs: {
        homeConfiguratoins."USERNAME" = home-manager.lib.homeManagerConfiguration {
          # ...
          modules = [
            # ...
            inputs.styler.homeManagerModule
          ];
        };
      };
    }
    ```

## Usage

1. Configure a theme
    <!-- TODO -->
2. Select which apps to style
    <!-- TODO -->
3. If an app is not supported by styler, you can manually access colors with
    <!-- TODO -->
    ```nix
    {inputs, ...}@args: {
      programs.some-program.settings = {
        accent = (inputs.styler.lib args).queryColor "accent";
      }
    }
    ```
