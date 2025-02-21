{
  config,
  lib,
  ...
}: {
  mkTarget = {
    name,
    nameHuman ? name,
    opts ? {},
    cfg ? {},
  }: let
    nameList =
      if builtins.isList name
      then name
      else [name];
    configLocal = lib.attrByPath nameList {} config.consona.targets;
  in {
    options.consona.targets = lib.setAttrByPath nameList (
      {
        enable = lib.mkEnableOption "theming for ${nameHuman}" // {default = config.consona.autoEnable;};
      }
      // opts
    );
    config = lib.mkIf (config.consona.enable && configLocal.enable) (
      if builtins.isFunction cfg
      then cfg configLocal
      else cfg
    );
  };
}
