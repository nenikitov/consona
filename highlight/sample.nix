# Some sample nix code
{
  lib,
  pkgs,
  ...
} @ args: let
  getBackgroundColor = timeOfDay:
    if timeOfDay == "morning"
    then "lightyellow"
    else if timeOfDay == "afternoon"
    then "lightblue"
    else "black";
  backgroundColor = getBackgroundColor "morning";
  content = [
    (greet "Nix User")
    "Background color: ${backgroundColor}"
    true
    null
  ];
  output = builtins.concatStringsSep "\n" content;
  multiply = x: y: x * y;
  multiplyOther = {x ? 10, y}: x * y;
  test = import ./whatever args;
in {
  imports = [
    ./my/module/here
    ./my/other/module.nix
  ];
  options = {
    test = lib.mkOption {
      name = "hello";
      default = 10;
    };
  };
  config = let
    inherit (lib) mkOption mkOptionType;
  in {
    xdg.configFile."my/app.cfg".text = ''
      Some configuration
    '';
    home.packages = with pkgs; [
      neofetch
      zip
    ];
  };
}
