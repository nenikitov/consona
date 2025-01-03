args: let
  libConsona = import ../../lib args;
  inherit (libConsona) palette;
  inherit (libConsona.transform) hex;
in
  libConsona.mkModule {
    name = "alacritty";
    nameHuman = "Alacritty";
    cfg = {
      programs.alacritty.settings = {
        colors = {
          primary = {
            background = hex palette.bg;
            foreground = hex palette.fg;
          };
          normal = {
            black = hex palette.black;
            red = hex palette.red;
            green = hex palette.green;
            yellow = hex palette.yellow;
            blue = hex palette.blue;
            magenta = hex palette.magenta;
            cyan = hex palette.cyan;
            white = hex palette.white;
          };
          bright = {
            black = hex palette.standoutBlack;
            red = hex palette.standoutRed;
            green = hex palette.standoutGreen;
            yellow = hex palette.standoutYellow;
            blue = hex palette.standoutBlue;
            magenta = hex palette.standoutMagenta;
            cyan = hex palette.standoutCyan;
            white = hex palette.standoutWhite;
          };
          # TODO(nenikitov): Look into changing `selection` colors too
        };
        # TODO(nenikitov): Add `window.opacity`
      };
    };
  }
