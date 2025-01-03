{lib, ...} @ args: let
  libConsona = import ../../lib args;
  inherit (libConsona) header palette;
  inherit (libConsona.transform) hexNoHash;
in
  libConsona.mkModule {
    name = "tty";
    nameHuman = "TTY";
    cfg = let
      initExtra =
        lib.mkBefore
        # sh
        ''
          # ${header}
          # TTY color scheme
          if [ "''${TERM}" = "linux" ]; then
            echo -en "\e]P0${hexNoHash palette."bg"}"
            echo -en "\e]P1${hexNoHash palette."red"}"
            echo -en "\e]P2${hexNoHash palette."green"}"
            echo -en "\e]P3${hexNoHash palette."yellow"}"
            echo -en "\e]P4${hexNoHash palette."blue"}"
            echo -en "\e]P5${hexNoHash palette."magenta"}"
            echo -en "\e]P6${hexNoHash palette."cyan"}"
            echo -en "\e]P7${hexNoHash palette."white"}"
            echo -en "\e]P8${hexNoHash palette."standoutBlack"}"
            echo -en "\e]P9${hexNoHash palette."standoutRed"}"
            echo -en "\e]PA${hexNoHash palette."standoutGreen"}"
            echo -en "\e]PB${hexNoHash palette."standoutYellow"}"
            echo -en "\e]PC${hexNoHash palette."standoutBlue"}"
            echo -en "\e]PD${hexNoHash palette."standoutMagenta"}"
            echo -en "\e]PE${hexNoHash palette."standoutCyan"}"
            echo -en "\e]PF${hexNoHash palette."fg"}"
          fi
        '';
    in {
      programs = {
        bash = {inherit initExtra;};
        zsh = {inherit initExtra;};
        # TODO(nenikitov): Add fish support
      };
    };
  }
