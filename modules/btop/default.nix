{
  lib,
  config,
  ...
}:
with config.lib.consona; {
  options.consona.targets.btop.enable = mkTargetOption "BTop";
  config = lib.mkIf (mkTargetCondition "btop") {
    programs.btop.settings.color_theme = "TTY";
  };
}
