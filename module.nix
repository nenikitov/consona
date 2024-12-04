{libStyler, ...}: {
  pkgs,
  config,
  lib ? pkgs.lib,
  ...
}:
with lib; let
  cfg = config.styler;
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
        "brightBlack"
        "brightRed"
        "brightGreen"
        "brightYellow"
        "brightBlue"
        "brightMagenta"
        "brightCyan"
        "brightWhite"
      ];
    };
  mkHexColorOption = description:
    mkOption {
      inherit description;
      example = "#C0FFEE";
      type = types.strMatching "^#[0-9A-F]{6}$";
    };
in {
  options.styler = {
    enable = mkEnableOption "Global adaptive styler toggle";
    colors = {
      ansi = {
        fg = mkHexColorOption "Default foreground color";
        bg = mkHexColorOption "Default background color";
        black = mkHexColorOption "Black (ANSI index 0)";
        red = mkHexColorOption "Red (ANSI index 1)";
        green = mkHexColorOption "Green (ANSI index 2)";
        yellow = mkHexColorOption "Yellow (ANSI index 3)";
        blue = mkHexColorOption "Blue (ANSI index 4)";
        magenta = mkHexColorOption "Magenta (ANSI index 5)";
        cyan = mkHexColorOption "Cyan (ANSI index 6)";
        white = mkHexColorOption "White (ANSI index 7)";
        brightBlack = mkHexColorOption "Bright black (ANSI index 8)";
        brightRed = mkHexColorOption "Bright red (ANSI index 9)";
        brightGreen = mkHexColorOption "Bright green (ANSI index A)";
        brightYellow = mkHexColorOption "Bright yellow (ANSI index B)";
        brightBlue = mkHexColorOption "Bright blue (ANSI index C)";
        brightMagenta = mkHexColorOption "Bright magenta (ANSI index D)";
        brightCyan = mkHexColorOption "Bright cyan (ANSI index E)";
        brightWhite = mkHexColorOption "Bright white (ANSI index F)";
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
