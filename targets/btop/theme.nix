{lib, ...} @ args: let
  libConsona = import ../../lib args;
  inherit (lib.strings) toUpper;
  inherit (libConsona) palette semantic;
  inherit (libConsona.script) header;
  inherit (libConsona.transform) colorToHex overlayToColor;
  capitalize = s: "${toUpper (builtins.substring 0 1 s)}${builtins.substring 1 (-1) s}";
  mkMonotoneGradient = name: color:
  # ini
  ''
    theme[${name}_start]="${colorToHex (overlayToColor {
      inherit color;
      opacity = 0.5;
    })}"
    theme[${name}_mid]="${colorToHex palette."${color}"}"
    theme[${name}_end]="${colorToHex palette."standout${capitalize color}"}"
  '';
in
  # ini
  ''
    # ${header}
    # Main colors
    theme[main_bg]="${colorToHex palette.bg}"
    theme[main_fg]="${colorToHex palette.fg}"
    theme[selected_bg]="${colorToHex (overlayToColor semantic.ui.selection)}"
    theme[selected_fg]="${colorToHex palette.fg}"
    theme[inactive_fg]="${colorToHex palette."${semantic.ui.inactive}"}"
    theme[title]="${colorToHex palette.fg}"
    theme[graph_text]="${colorToHex palette.fg}"
    theme[hi_fg]="${colorToHex palette."${semantic.ui.accent}"}"
    theme[div_line]="${colorToHex palette."${semantic.ui.separator}"}"
    # CPU
    theme[cpu_box]="${colorToHex palette."${semantic.ui.separator}"}"
    theme[cpu_start]="${colorToHex palette.green}"
    theme[cpu_mid]="${colorToHex palette.yellow}"
    theme[cpu_end]="${colorToHex palette.red}"
    ${mkMonotoneGradient "temp" "blue"}
    # Memory
    theme[mem_box]="${colorToHex palette."${semantic.ui.separator}"}"
    ${mkMonotoneGradient "used" "red"}
    ${mkMonotoneGradient "available" "yellow"}
    ${mkMonotoneGradient "cached" "blue"}
    ${mkMonotoneGradient "free" "green"}
    # Network
    theme[net_box]="${colorToHex palette."${semantic.ui.separator}"}"
    ${mkMonotoneGradient "download" "blue"}
    ${mkMonotoneGradient "upload" "cyan"}
    # Proc
    theme[proc_box]="${colorToHex palette."${semantic.ui.separator}"}"
    theme[proc_misc]="${colorToHex palette.green}"
  ''
