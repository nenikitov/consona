{lib, ...} @ args: let
  libConsona = import ../lib args;
  inherit (lib) mkEnableOption;
  inherit (libConsona.options) mkColorOption mkOverlayOption mkCodeStyleOption;
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
        comment = mkCodeStyleOption "comment, docstring";
        literalText = mkCodeStyleOption "character, string, path, url";
        literalNumber = mkCodeStyleOption "integer, float";
        literalLanguage = mkCodeStyleOption "boolean, null";
        literalEscape = mkCodeStyleOption "escaped character, format placeholder, unit";
        typePrimitive = mkCodeStyleOption "boolean, integer, float, enum variant";
        typeComplex = mkCodeStyleOption "class, interface, enum, xml tag";
        typeModule = mkCodeStyleOption "namespace, module, package, globally exposed language variables";
        functionNative = mkCodeStyleOption "funciton, method, command";
        functionMeta = mkCodeStyleOption "macro callable as function, alias";
        variable = mkCodeStyleOption "variable, constant, parameter, property, lifetime, label";
        keywordLanguage = mkCodeStyleOption "declaration marker, flow control, compiler directive, operator that is a word (`and`, `new`)";
        keywordOperator = mkCodeStyleOption "operator that is a symbol (`=`, `?`, `.`)";
        keywordDelimiter = mkCodeStyleOption "object groups and separators, namespace access";
      };

      ui = {
        selection = mkOverlayOption "selection";
      };

      # TODO(nenikitov): Add UI colors, and more
    };
  };
}
