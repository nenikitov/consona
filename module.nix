{
  pkgs,
  config,
  lib ? pkgs.lib,
  ...
} @ args:
with lib; let
  cfg = config.consona;
  mkNamedColorOption = description: default:
    mkOption {
      inherit description;
      inherit default;
      type = types.enum [
        "fg"
        "bg"
        "black"
        "red"
        "green"
        "yellow"
        "blue"
        "magenta"
        "cyan"
        "white"
        "standoutBlack"
        "standoutRed"
        "standoutGreen"
        "standoutYellow"
        "standoutBlue"
        "standoutMagenta"
        "standoutCyan"
        "standoutWhite"
      ];
    };
  mkHexColorOption = description:
    mkOption {
      inherit description;
      example = "#C0FFEE";
      type = types.strMatching "^#[0-9A-F]{6}$";
    };
in {
  imports = [
    ./modules
  ];
  options.consona = {
    enable = mkEnableOption "global Consona toggle";
    autoEnable = mkEnableOption "auto enable all stler targets";
    colors = {
      ansi = {
        primary = {
          fg = mkHexColorOption "Default foreground color";
          bg = mkHexColorOption "Default background color";
        };
        normal = {
          black = mkHexColorOption "Black (ANSI index 0)";
          red = mkHexColorOption "Red (ANSI index 1)";
          green = mkHexColorOption "Green (ANSI index 2)";
          yellow = mkHexColorOption "Yellow (ANSI index 3)";
          blue = mkHexColorOption "Blue (ANSI index 4)";
          magenta = mkHexColorOption "Magenta (ANSI index 5)";
          cyan = mkHexColorOption "Cyan (ANSI index 6)";
          white = mkHexColorOption "White (ANSI index 7)";
        };
        standout = {
          black = mkHexColorOption "Standout (brighter in dark mode, darker in light mode) black (ANSI index 8)";
          red = mkHexColorOption "Standout (brighter in dark mode, darker in light mode) red (ANSI index 9)";
          green = mkHexColorOption "Standout (brighter in dark mode, darker in light mode) green (ANSI index A)";
          yellow = mkHexColorOption "Standout (brighter in dark mode, darker in light mode) yellow (ANSI index B)";
          blue = mkHexColorOption "Standout (brighter in dark mode, darker in light mode) blue (ANSI index C)";
          magenta = mkHexColorOption "Standout (brighter in dark mode, darker in light mode) magenta (ANSI index D)";
          cyan = mkHexColorOption "Standout (brighter in dark mode, darker in light mode) cyan (ANSI index E)";
          white = mkHexColorOption "Standout (brighter in dark mode, darker in light mode) white (ANSI index F)";
        };
      };
      code = {
        unknown = mkNamedColorOption "Unrecognized token";
        comment = mkNamedColorOption "Comment";
        literalNumber = mkNamedColorOption "Integer and float literals";
        literalBuiltin = mkNamedColorOption "Booleans and null literals";
        literalString = mkNamedColorOption "String literals";
        literalEscape = mkNamedColorOption "Character escapes inside strings";
        entityType = mkNamedColorOption "Type and interface names";
        entityPrimitive = mkNamedColorOption "Built in data type names";
        entityFunction = mkNamedColorOption "Function names";
        entityNamespace = mkNamedColorOption "Package names";
        entityVariable = mkNamedColorOption "Variable names";
        entityConstant = mkNamedColorOption "Constant names";
        keyword = mkNamedColorOption "Keywords";
        operator = mkNamedColorOption "Operators";
        punctuation = mkNamedColorOption "Delimiters, brackets and braces";
      };
      change = {
        add = mkNamedColorOption "Added in diff";
        change = mkNamedColorOption "Changed in diff";
        remove = mkNamedColorOption "Removed in diff";
      };
      diagnostic = {
        error = mkNamedColorOption "Error diagnostics";
        warning = mkNamedColorOption "Warning diagnostics";
        info = mkNamedColorOption "Information diagnostics";
        hint = mkNamedColorOption "Hint diagnostics";
      };
      ui = {
        accent1 = mkNamedColorOption "First accent";
        accent2 = mkNamedColorOption "Second accent";
        confirm = mkNamedColorOption "Confirmation";
        danger = mkNamedColorOption "Cancel, error, or dangerous";
        separator = mkNamedColorOption "Borders";
      };
    };
  };
}
