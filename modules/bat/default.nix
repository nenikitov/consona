{
  lib,
  config,
  ...
} @ args:
with config.lib.consona; {
  options.consona.targets.bat.enable = mkTargetOption "Bat";
  config = lib.mkIf (mkTargetCondition "bat") {
    programs.bat = {
      config.theme = "consona";
      themes."consona".src = builtins.toFile "consona.tmTheme" (import ./theme.nix args);
    };
  };
}
