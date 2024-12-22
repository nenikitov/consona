{
  lib,
  config,
  ...
} @ args: let
  inherit
    (lib)
    mkIf
    mkMerge
    ;
  inherit
    (config.lib.consona)
    mkTargetOption
    mkTargetCondition
    ansiToHex
    ;
in {
  options.consona.targets.btop = {
    enable = mkTargetOption "btop";
    theme = lib.mkOption {
      description = "Whether the target uses full-color or TTY theme";
      default = "tty";
      type = lib.types.enum ["full-color" "tty"];
    };
  };
  config = mkIf (mkTargetCondition "btop") (
    # TODO(nenikitov): Make this into `mkIfElse` that doesn't cause recursion errors
    lib.mkMerge [
      (lib.mkIf
        (config.consona.targets.btop.theme == "tty")
        {
          programs.btop.settings.color_theme = "TTY";
        })
      (lib.mkIf
        (config.consona.targets.btop.theme == "full-color")
        {
          programs.btop.settings.color_theme = "consona";
          xdg.configFile."btop/themes/consona.theme".text = import ./theme.nix args;
        })
    ]
  );
}
