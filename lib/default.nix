{
  lib,
  config,
  ...
}:
with lib; {
  lib.styler = {
    # TODO(nenikitov): Make a `mkModule name nameHuman cfg` that will combine all boilerplate
    # For whatever reason I'm getting infinite recursion errors?

    mkTargetOption = name:
      mkEnableOption "theming for ${name}"
      // {
        default = config.styler.autoEnable;
      };

    mkTargetCondition = name: (config.styler.enable && config.styler.targets."${name}".enable);

    ansiToHex = color: let
      c = config.styler.colors.ansi;
    in
      {
        inherit (c.primary) "fg" "bg";
        inherit (c.normal) "black" "red" "green" "yellow" "blue" "magenta" "cyan" "white";
        "standoutBlack" = c.standout.black;
        "standoutRed" = c.standout.red;
        "standoutGreen" = c.standout.green;
        "standoutYellow" = c.standout.yellow;
        "standoutBlue" = c.standout.blue;
        "standoutMagenta" = c.standout.magenta;
        "standoutCyan" = c.standout.cyan;
        "standoutWhite" = c.standout.white;
      }
      ."${color}"
      or (throw "Not an ANSII color ${color}");
  };
}
