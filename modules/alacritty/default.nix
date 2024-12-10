{
  lib,
  config,
  ...
}: {
  options.styler.targets.alacritty = lib.mkEnableOption "theming for alacritty";
  config = lib.mkIf (config.styler.enable && config.styler.targets.alacritty) (with config.lib.styler; {
    programs.alacritty.settings = {
      colors = {
        primary = {
          background = ansiToHex "bg";
          foreground = ansiToHex "fg";
        };
        normal = {
          black = ansiToHex "black";
          red = ansiToHex "red";
          green = ansiToHex "green";
          yellow = ansiToHex "yellow";
          blue = ansiToHex "blue";
          magenta = ansiToHex "magenta";
          cyan = ansiToHex "cyan";
          white = ansiToHex "white";
        };
        bright = {
          black = ansiToHex "standoutBlack";
          red = ansiToHex "standoutRed";
          green = ansiToHex "standoutGreen";
          yellow = ansiToHex "standoutYellow";
          blue = ansiToHex "standoutBlue";
          magenta = ansiToHex "standoutMagenta";
          cyan = ansiToHex "standoutCyan";
          white = ansiToHex "standoutWhite";
        };
      };
    };
  });
}
