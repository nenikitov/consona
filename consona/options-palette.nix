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
  mkCodeOption = description: {
    color = mkAnsiOption "Foreground color for ${description}";
    bold = mkEnableOption "Bold style for ${description}" // {default = false;};
    italic = mkEnableOption "Italic style for ${description}" // {default = false;};
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

      code = {
        # TODO(nenikitov): Tweak this if necessary, not sure about all of these for now
        comment = mkCodeOption "comment, docstring";
        literalText = mkCodeOption "character, string, path, url";
        literalNumber = mkCodeOption "integer, float";
        literalLanguage = mkCodeOption "boolean, null";
        literalEscape = mkCodeOption "escaped character, format placeholder, unit";
        typePrimitive = mkCodeOption "boolean, integer, float, enum variant";
        typeComplex = mkCodeOption "class, interface, enum, xml tag";
        typeModule = mkCodeOption "namespace, module, package, globally exposed language variables";
        functionNative = mkCodeOption "funciton, method, command";
        functionMeta = mkCodeOption "macro callable as function, alias";
        variable = mkCodeOption "variable, constant, parameter, property, lifetime, label";
        keywordLanguage = mkCodeOption "declaration marker, flow control, compiler directive, operator that is a word (`and`, `new`)";
        keywordOperator = mkCodeOption "operator that is a symbol (`=`, `?`, `.`)";
        keywordDelimiter = mkCodeOption "object groups and separators, namespace access";
      };

      # TODO(nenikitov): Add UI colors, and more
    };
  };
}
