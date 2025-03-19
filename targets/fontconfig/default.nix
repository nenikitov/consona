{lib, ...} @ args: let
  libConsona = import ../../lib args;
  inherit (lib) isList;
  inherit (libConsona) mkTarget configConsona;
  fontNamesFrom = fonts:
    if isList fonts
    then builtins.map (f: f.name) fonts
    else fontNamesFrom [fonts];
  fontPackagesFrom = fonts:
    if isList fonts
    then builtins.map (f: f.package) fonts
    else fontPackagesFrom [fonts];
  configFonts = configConsona.fonts;
in
  mkTarget {
    name = "fontconfig";
    nameHuman = "Fontconfig";
    enable = true;
    cfg = {
      fonts.fontconfig = {
        enable = true;
        defaultFonts = {
          emoji = fontNamesFrom configFonts.emoji;
          monospace = (fontNamesFrom configFonts.monospace) ++ (fontNamesFrom configFonts.fallback);
          sansSerif = (fontNamesFrom configFonts.sansSerif) ++ (fontNamesFrom configFonts.fallback);
          serif = (fontNamesFrom configFonts.serif) ++ (fontNamesFrom configFonts.fallback);
        };
      };
      # TODO(nenikitov): Maybe use pipes here
      home.packages =
        (fontPackagesFrom configFonts.emoji)
        ++ (fontPackagesFrom configFonts.fallback)
        ++ (fontPackagesFrom configFonts.monospace)
        ++ (fontPackagesFrom configFonts.sansSerif)
        ++ (fontPackagesFrom configFonts.serif);
    };
  }
