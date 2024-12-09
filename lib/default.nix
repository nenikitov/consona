{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.styler;
in {
  ansiiToHex = color:
    if color == "fg"
    then cfg.colors.ansi.primary.fg
    else if color == "bg"
    then cfg.colors.ansi.primary.bg
    else if color == "black"
    then cfg.colors.ansi.normal.black
    else if color == "red"
    then cfg.colors.ansi.normal.red
    else if color == "green"
    then cfg.colors.ansi.normal.green
    else if color == "yellow"
    then cfg.colors.ansi.normal.yellow
    else if color == "blue"
    then cfg.colors.ansi.normal.blue
    else if color == "magenta"
    then cfg.colors.ansi.normal.magenta
    else if color == "cyan"
    then cfg.colors.ansi.normal.cyan
    else if color == "white"
    then cfg.colors.ansi.normal.white
    else if color == "standoutBlack"
    then cfg.colors.ansi.standout.black
    else if color == "standoutRed"
    then cfg.colors.ansi.standout.red
    else if color == "standoutGreen"
    then cfg.colors.ansi.standout.green
    else if color == "standoutYellow"
    then cfg.colors.ansi.standout.yellow
    else if color == "standoutBlue"
    then cfg.colors.ansi.standout.blue
    else if color == "standoutMagenta"
    then cfg.colors.ansi.standout.magenta
    else if color == "standoutCyan"
    then cfg.colors.ansi.standout.cyan
    else if color == "standoutWhite"
    then cfg.colors.ansi.standout.white
    else throw "Not an ANSII color ${color}";
}
