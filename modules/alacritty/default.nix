args: let
  libConsona = import ../../lib args;
  inherit (libConsona) palette;
  inherit (libConsona.transform) colorToHex;
in
  libConsona.mkModule {
    name = "alacritty";
    nameHuman = "Alacritty";
    cfg = {
      programs.alacritty.settings = {
        colors = {
          primary = {
            background = colorToHex palette.bg;
            foreground = colorToHex palette.fg;
          };
          normal = {
            black = colorToHex palette.black;
            red = colorToHex palette.red;
            green = colorToHex palette.green;
            yellow = colorToHex palette.yellow;
            blue = colorToHex palette.blue;
            magenta = colorToHex palette.magenta;
            cyan = colorToHex palette.cyan;
            white = colorToHex palette.white;
          };
          bright = {
            black = colorToHex palette.standoutBlack;
            red = colorToHex palette.standoutRed;
            green = colorToHex palette.standoutGreen;
            yellow = colorToHex palette.standoutYellow;
            blue = colorToHex palette.standoutBlue;
            magenta = colorToHex palette.standoutMagenta;
            cyan = colorToHex palette.standoutCyan;
            white = colorToHex palette.standoutWhite;
          };
          # TODO(nenikitov): Look into changing `selection` colors too
        };
        # TODO(nenikitov): Add `window.opacity`
      };
    };
  }
