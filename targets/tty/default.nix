{lib, ...} @ args: let
  libConsona = import ../../lib args;
  inherit (lib) mkBefore;
  inherit (libConsona) palette;
  inherit (libConsona.transform) colorToHexNoHash;
  inherit (libConsona.script) mkScript mkCodeIfElseHighColor;
in
  libConsona.mkTarget {
    name = "tty";
    nameHuman = "TTY";
    cfg = let
      initExtra = mkBefore (mkScript.bash "TTY color scheme" (mkCodeIfElseHighColor.bash ""
        # sh
        ''
          echo -en "\e]P0${colorToHexNoHash palette.bg}"
          echo -en "\e]P1${colorToHexNoHash palette.red}"
          echo -en "\e]P2${colorToHexNoHash palette.green}"
          echo -en "\e]P3${colorToHexNoHash palette.yellow}"
          echo -en "\e]P4${colorToHexNoHash palette.blue}"
          echo -en "\e]P5${colorToHexNoHash palette.magenta}"
          echo -en "\e]P6${colorToHexNoHash palette.cyan}"
          echo -en "\e]P7${colorToHexNoHash palette.white}"
          echo -en "\e]P8${colorToHexNoHash palette.standoutBlack}"
          echo -en "\e]P9${colorToHexNoHash palette.standoutRed}"
          echo -en "\e]PA${colorToHexNoHash palette.standoutGreen}"
          echo -en "\e]PB${colorToHexNoHash palette.standoutYellow}"
          echo -en "\e]PC${colorToHexNoHash palette.standoutBlue}"
          echo -en "\e]PD${colorToHexNoHash palette.standoutMagenta}"
          echo -en "\e]PE${colorToHexNoHash palette.standoutCyan}"
          echo -en "\e]PF${colorToHexNoHash palette.fg}"
        ''));
    in {
      programs = {
        bash = {inherit initExtra;};
        zsh = {inherit initExtra;};
        # TODO(nenikitov): Add fish support
      };
    };
  }
