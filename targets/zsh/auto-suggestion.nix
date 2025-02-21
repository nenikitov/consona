{lib, ...} @ args: let
  libConsona = import ../../lib args;
  inherit (lib) mkBefore;
  inherit (libConsona) semantic;
  inherit (libConsona.transform) codeStyleToZshZle codeStyleToZshZleLowColor;
  inherit (libConsona.script) mkScript mkCodeIfElseHighColor;
in
  libConsona.mkTarget {
    name = ["zsh" "autoSuggestion"];
    nameHuman = "zsh auto suggestion";
    cfg = {
      # HACK(nenikitov): Not sure how, but try to move to `programs.zsh.autosuggestion.highlight` instead
      # This is because I need to write a run-time conditional which isn't possible since home-manager writes the option in single quotes, preventing any injections
      programs.zsh.initExtra = mkBefore (
        mkScript.bash "Auto suggestion color" (
          mkCodeIfElseHighColor.bash
          # sh
          "ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='${codeStyleToZshZle semantic.code.comment}'"
          # sh
          "ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='${codeStyleToZshZleLowColor semantic.code.comment}'"
        )
      );
    };
  }
