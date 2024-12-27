{lib, ...}: {
  types = {
    ansi = lib.types.enum [
      "fg"
      "bg"
      "black"
      "red"
      "green"
      "yellow"
      "blue"
      "magenta"
      "cyan"
      "white"
      "standoutBlack"
      "standoutRed"
      "standoutGreen"
      "standoutYellow"
      "standoutBlue"
      "standoutMagenta"
      "standoutCyan"
      "standoutWhite"
    ];
    color = lib.types.strMatching "^#[0-9A-F]{6}$";
  };
}
