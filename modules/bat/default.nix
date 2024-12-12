{
  lib,
  config,
  ...
} @ args:
with config.lib.styler; {
  options.styler.targets.bat.enable = mkTargetOption "Bat";
  config = lib.mkIf (mkTargetCondition "bat") {
    programs.bat = {
      config.theme = "adaptive-styler";
      themes."adaptive-styler".src = builtins.toFile "adaptive-styler.tmTheme" (import ./theme.nix args);
    };
  };
}
