{lib, ...} @ args: let
  libConsona = import ../../lib args;
  inherit (lib) mkBefore foldlAttrs mapAttrsToList concatStringsSep;
  inherit (libConsona) mkTarget semantic;
  inherit (libConsona.transform) codeStyleToZshZle codeStyleToZshZleLowColor;
  inherit (libConsona.script) mkScript mkCodeIfElseHighColor;

  highlights = {
    # TODO(nenikitov): Add `unknown-token`
    # DOCS: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
    comment = ["comment"];
    literalText = ["path" "path_prefix" "single-quoted-argument" "single-quoted-argument-unclosed" "double-quoted-argument" "double-quoted-argument-unclosed" "dollar-quoted-argument" "dollar-quoted-argument-unclosed" "named-fd"];
    literalNumber = ["numeric-fd"];
    literalLanguage = [];
    literalEscape = ["globbing" "rc-quote" "back-double-quoted-argument" "back-dollar-quoted-argument"];
    typePrimitive = [];
    typeComplex = [];
    typeModule = [];
    functionNative = ["builtin" "function" "command" "history-expansion" "autodirectory"];
    functionMeta = ["alias" "suffix-alias" "global-alias" "hashed-command"];
    variable = ["single-hyphen-option" "double-hyphen-option" "dollar-double-quoted-argument" "assign" "arg0" "default"];
    keywordLanguage = ["reserved-word" "precommand"];
    keywordOperator = ["commandseparator" "command-substitution-delimiter" "process-substitution-delimiter" "arithmetic-expansion" "back-quoted-argument-delimiter" "back-quoted-argument-delimiter-unclosed" "redirection"];
    keywordDelimiter = [];
  };
  flattenHighlights = builder:
    foldlAttrs
    (
      acc: token: groups:
        acc
        // lib.pipe
        groups
        [
          (builtins.map (g: {
            name = g;
            value = builder semantic.code."${token}";
          }))
          builtins.listToAttrs
        ]
    )
    {}
    highlights;
  buildHighlights = builder:
    lib.pipe
    builder
    [
      flattenHighlights
      (mapAttrsToList (k: v: "ZSH_HIGHLIGHT_STYLES+=(${k} '${v}')"))
      (concatStringsSep "\n")
    ];
in
  mkTarget {
    name = ["zsh" "syntaxHighlighting"];
    nameHuman = "zsh syntax highlighting";
    cfg = {
      # HACK(nenikitov): Not sure how, but try to move to `programs.zsh.syntaxHighlighting.styles` instead
      # This is because I need to write a run-time conditional which isn't possible since home-manager writes the option in single quotes, preventing any injections
      programs.zsh.initExtra = mkBefore (
        mkScript.bash "Syntax highlighting colors"
        # sh
        ''
          typeset -A ZSH_HIGHLIGHT_STYLES
          ${
            mkCodeIfElseHighColor.bash
            (buildHighlights codeStyleToZshZle)
            (buildHighlights codeStyleToZshZleLowColor)
          }
        ''
      );
    };
  }
