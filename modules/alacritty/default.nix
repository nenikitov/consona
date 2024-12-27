args: let
  libConsona = import ../../lib args;
  inherit (libConsona) query;
  inherit (libConsona.transform) hex;
in
  libConsona.mkModule {
    name = "alacritty";
    nameHuman = "Alacritty";
    cfg = {
      programs.alacritty.settings = {
        colors = {
          primary = {
            background = hex (query "bg");
            foreground = hex (query "fg");
          };
          normal = {
            black = hex (query "black");
            red = hex (query "red");
            green = hex (query "green");
            yellow = hex (query "yellow");
            blue = hex (query "blue");
            magenta = hex (query "magenta");
            cyan = hex (query "cyan");
            white = hex (query "white");
          };
          bright = {
            black = hex (query "standoutBlack");
            red = hex (query "standoutRed");
            green = hex (query "standoutGreen");
            yellow = hex (query "standoutYellow");
            blue = hex (query "standoutBlue");
            magenta = hex (query "standoutMagenta");
            cyan = hex (query "standoutCyan");
            white = hex (query "standoutWhite");
          };
          # TODO(nenikitov): Look into changing `selection` colors too
        };
        # TODO(nenikitov): Add `window.opacity`
      };
    };
  }
