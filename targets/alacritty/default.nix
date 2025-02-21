args: let
  libConsona = import ../../lib args;
  inherit (libConsona) palette semantic;
  inherit (libConsona.transform) colorToHex overlayToColor;
in
  libConsona.mkTarget {
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
          selection = {
            text = "CellForeground";
            background = colorToHex (overlayToColor semantic.ui.selection);
          };
          search = {
            matches = {
              foreground = "CellForeground";
              background = colorToHex (overlayToColor semantic.ui.match);
            };
            focused_match = {
              foreground = "CellForeground";
              background = colorToHex (overlayToColor semantic.ui.matchCurrent);
            };
          };
        };
        # TODO(nenikitov): Add `window.opacity`
      };
    };
  }
