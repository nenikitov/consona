self: {
  pkgs,
  config,
  lib ? pkgs.lib,
  ...
}: let
  cfg = config.styler;
in
  with lib; {
    options.styler = {
      enable = mkEnableOption "Global Adaptive Styler toggle";
    };
  }
