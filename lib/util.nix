{
  lib,
  config,
  ...
}: let
  inherit
    (lib)
    mkEnableOption
    mkIf
    mkMerge
    ;
in {
  config.lib.consona = {
    # TODO(nenikitov): Make a `mkModule name nameHuman cfg` that will combine all boilerplate
    # For whatever reason I'm getting infinite recursion errors?

    mkIfElse = cond: t: f: mkMerge [(mkIf cond t) (mkIf (!cond) f)];

    mkTargetCondition = name: (config.consona.enable && config.consona.targets."${name}".enable);

    mkTargetOption = name:
      mkEnableOption "theming for ${name}"
      // {
        default = config.consona.autoEnable;
      };
  };
}
