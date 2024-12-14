{
  lib,
  config,
  ...
}:
with config.lib.consona; {
  options.consona.targets.alacritty.enable = mkTargetOption "Alacritty";
  config = lib.mkIf (mkTargetCondition "alacritty") {
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
        # TODO(nenikitov): Look into changing `selection` colors too
      };
      # TODO(nenikitov): Add `window.opaciry`
    };
  };
}
