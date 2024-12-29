{lib, ...}: rec {
  types = {
    ansiList = [
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

    ansi = lib.types.enum (["fg" "bg"] ++ types.ansiList);
    color = types._mkParsersOptionType {
      name = "color";
      description = ''color in one of these formats: "#123", "#123456", {r=255; g=255; b=255;}'';
      parsers = [
        # "#123" format
        (x: let
          match = builtins.match "#([[:xdigit:]])([[:xdigit:]])([[:xdigit:]])" x;
          component = i: transform._toDec "${builtins.elemAt match i}${builtins.elemAt match i}";
        in
          if builtins.isString x && match != null
          then {
            r = component 0;
            g = component 1;
            b = component 2;
          }
          else null)
        # "#123456" format
        (x: let
          match = builtins.match "#([[:xdigit:]]{2})([[:xdigit:]]{2})([[:xdigit:]]{2})" x;
          component = i: transform._toDec (builtins.elemAt match i);
        in
          if builtins.isString x && match != null
          then {
            r = component 0;
            g = component 1;
            b = component 2;
          }
          else null)
        # {r=255; g=255; b=255;} format
        (x: let
          isRgbComponent = c: builtins.isInt (x."${c}" or null) && x."${c}" > 0 && x."${c}" < 256;
        in
          if (builtins.isAttrs x && isRgbComponent "r" && isRgbComponent "g" && isRgbComponent "b")
          then {inherit (x) r g b;}
          else null)
      ];
    };

    _mkParsersOptionType = {
      name,
      description ? null,
      parsers,
    }:
      lib.mkOptionType {
        inherit name description;
        check = x: builtins.any (p: p x != null) parsers;
        # TODO(nenikitov): Refactor this to pipes
        merge = loc: defs:
          lib.mergeEqualOption
          loc
          (builtins.map
            (d:
              d
              // {
                value =
                  builtins.head
                  (builtins.filter
                    (v: v != null)
                    (builtins.map (p: p d.value) parsers));
              })
            defs);
      };
  };
  transform = {
    _parseDigit = c:
      {
        "0" = 0;
        "1" = 1;
        "2" = 2;
        "3" = 3;
        "4" = 4;
        "5" = 5;
        "6" = 6;
        "7" = 7;
        "8" = 8;
        "9" = 9;
        "A" = 10;
        "B" = 11;
        "C" = 12;
        "D" = 13;
        "E" = 14;
        "F" = 15;
      }
      ."${lib.toUpper c}"
      or (throw "Not a hex digit ${c}");
    # TODO(nenikitov): Refactor this to pipes
    _toDec = s: builtins.foldl' (acc: n: acc * 16 + n) 0 (builtins.map transform._parseDigit (lib.stringToCharacters s));

    hexNoHash = {
      r,
      g,
      b,
    }: "${lib.toHexString r}${lib.toHexString g}${lib.toHexString b}";

    hex = c: "#${transform.hexNoHash c}";

    ansi = c:
      if c == "fg" || c == "bg"
      then null
      else (lib.lists.findFirstIndex (c': c == c') null types.ansiList);
  };
}
