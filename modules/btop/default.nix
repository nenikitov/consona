{lib, ...} @ args: let
  libConsona = import ../../lib args;
in
  libConsona.mkModule {
    name = "btop";
    opts = {
      theme = lib.mkOption {
        description = "Whether the target uses full-color or TTY theme";
        default = "tty";
        type = lib.types.enum ["full-color" "tty"];
      };
    };
    cfg = cfg:
      libConsona.mkIfElse
      (cfg.theme == "tty")
      {
        programs.btop.settings.color_theme = "TTY";
      }
      {
        programs.btop.settings.color_theme = "flat-remix-light";
        xdg.configFile."btop/themes/consona.theme".text = import ./theme.nix args;
      };
  }
# {
#   lib,
#   config,
#   ...
# } @ args: let
#   inherit
#     (lib)
#     mkIf
#     mkMerge
#     ;
#   libConsona = import ../../lib/default-new.nix args;
# in {
#   options.consona.targets.btop = {
#     enable = libConsona.mkTargetOption "btop";
#     theme = lib.mkOption {
#       description = "Whether the target uses full-color or TTY theme";
#       default = "tty";
#       type = lib.types.enum ["full-color" "tty"];
#     };
#   };
#   config = mkIf (libConsona.mkTargetCondition "btop") (
#     # TODO(nenikitov): Make this into `mkIfElse` that doesn't cause recursion errors
#     libConsona.mkIfElse (config.consona.targets.btop.theme == "tty")
#     {
#       programs.btop.settings.color_theme = "TTY";
#     }
#     {
#       programs.btop.settings.color_theme = "consona";
#       xdg.configFile."btop/themes/consona.theme".text = import ./theme.nix args;
#     }
#   );
# }
