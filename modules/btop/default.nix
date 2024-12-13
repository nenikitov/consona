{
  lib,
  config,
  ...
}:
with config.lib.styler; {
  options.styler.targets.btop.enable = mkTargetOption "BTop";
  config = lib.mkIf (mkTargetCondition "btop") {
    programs.btop.settings.color_theme = "TTY";
  };
}
