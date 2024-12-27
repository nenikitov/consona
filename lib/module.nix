{
  config,
  lib,
  ...
}: {
  mkModule = {
    name,
    nameHuman ? name,
    opts ? {},
    cfg ? {},
  }: {
    options.consona.targets."${name}" =
      {
        enable = lib.mkEnableOption "theming for ${nameHuman}" // {default = config.consona.autoEnable;};
      }
      // opts;
    config = lib.mkIf (config.consona.enable && config.consona.targets."${name}".enable) (
      if builtins.isFunction cfg
      then cfg config.consona.targets."${name}"
      else cfg
    );
  };
}
