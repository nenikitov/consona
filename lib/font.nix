{lib, ...}: let
  inherit (lib) literalExpression mkOption types;
in {
  options = {
    mkFontOption = description: optional: let
      fontSubmodule = {
        options = {
          name = mkOption {
            description = "Name of the ${description} font";
            example = "Mononoki";
            type = types.singleLineStr;
          };
          package = mkOption {
            description = "Package providing the ${description} font";
            example = literalExpression "pkgs.mononoki";
            type = types.package;
          };
        };
      };
    in
      mkOption {
        description = "Font(s) used for ${description}";
        example = {
          name = "Mononoki";
          package = literalExpression "pkgs.mononoki";
        };
        type =
          types.either
          (types.submodule fontSubmodule)
          ((
            if optional
            then types.listOf
            else types.nonEmptyListOf
          ) (types.submodule fontSubmodule));
      }
      // (
        if optional
        then {default = [];}
        else {}
      );
  };
}
