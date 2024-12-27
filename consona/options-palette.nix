{lib, ...} @ args: let
  libConsona = import ../lib args;
  inherit (lib) mkEnableOption;
  mkColorOption = description:
    lib.mkOption {
      inherit description;
      example = "#C0FFEE";
      type = libConsona.types.color;
    };
  mkAnsiOption = description:
    lib.mkOption {
      inherit description;
      example = "standoutGreen";
      type = libConsona.types.ansi;
    };
in {
  options.consona = {
    enable = mkEnableOption "global Consona toggle";
    autoEnable = mkEnableOption "auto enable all style targets";

    colors = {
      palette = {
        primary = {
          fg = mkColorOption "Default foreground color";
          bg = mkColorOption "Default background color";
        };
        normal = {
          black = mkColorOption "Black (ANSI index 0)";
          red = mkColorOption "Red (ANSI index 1)";
          green = mkColorOption "Green (ANSI index 2)";
          yellow = mkColorOption "Yellow (ANSI index 3)";
          blue = mkColorOption "Blue (ANSI index 4)";
          magenta = mkColorOption "Magenta (ANSI index 5)";
          cyan = mkColorOption "Cyan (ANSI index 6)";
          white = mkColorOption "White (ANSI index 7)";
        };
        standout = {
          black = mkColorOption "Standout (brighter in dark mode, darker in light mode) black (ANSI index 8)";
          red = mkColorOption "Standout (brighter in dark mode, darker in light mode) red (ANSI index 9)";
          green = mkColorOption "Standout (brighter in dark mode, darker in light mode) green (ANSI index A)";
          yellow = mkColorOption "Standout (brighter in dark mode, darker in light mode) yellow (ANSI index B)";
          blue = mkColorOption "Standout (brighter in dark mode, darker in light mode) blue (ANSI index C)";
          magenta = mkColorOption "Standout (brighter in dark mode, darker in light mode) magenta (ANSI index D)";
          cyan = mkColorOption "Standout (brighter in dark mode, darker in light mode) cyan (ANSI index E)";
          white = mkColorOption "Standout (brighter in dark mode, darker in light mode) white (ANSI index F)";
        };
      };

      # TODO(nenikitov): Add semantic colors, ui colors, etc
    };
  };
}