{config, ...}: {
  ansiToHex = color:
    with config.consona.colors.ansi;
      {
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
      }
      ."${color}"
      or (throw "Not an ANSII color ${color}");
}
