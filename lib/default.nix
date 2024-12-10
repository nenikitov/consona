{
  lib,
  config,
  ...
}:
with lib; {
  config.lib.styler = rec {
    # mkModule = name: nameHuman: cfg: {
    #   options.styler.target."${name}" = mkEnableOption "theming for ${nameHuman}" // {default = config.styler.autoEnable;};
    #   config = mkIf (config.styler.enable && config.styler.target."${name}") cfg;
    # };

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
