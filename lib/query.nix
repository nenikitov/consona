{config, ...}: {
  palette = with config.consona.colors.palette; {
    inherit (primary) "fg" "bg";
    inherit (normal) "black" "red" "green" "yellow" "blue" "magenta" "cyan" "white";
    "standoutBlack" = standout.black;
    "standoutRed" = standout.red;
    "standoutGreen" = standout.green;
    "standoutYellow" = standout.yellow;
    "standoutBlue" = standout.blue;
    "standoutMagenta" = standout.magenta;
    "standoutCyan" = standout.cyan;
    "standoutWhite" = standout.white;
  };
  semantic = with config.consona.colors; {
    inherit code;
  };
}
