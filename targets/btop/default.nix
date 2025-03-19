{lib, ...} @ args: let
  libConsona = import ../../lib args;
  inherit (lib) mkEnableOption;
  inherit (libConsona) mkTarget;
in
  mkTarget {
    name = "btop";
    nameHuman = "btop++";
    opts = {
      # TODO(nenikitov): Add support for non-fullcolor themes
      # https://github.com/aristocratos/btop/issues/1048
      fullcolor = (mkEnableOption "a fullcolor rather than ANSI only theme") // {default = true;};
    };
    cfg = configLocal: {
      programs.btop.settings = {
        theme_background = false;
        color_theme =
          if configLocal.fullcolor
          then "Consona"
          else "TTY";
      };
      xdg.configFile."btop/themes/Consona.theme".text = import ./theme.nix args;
    };
  }
