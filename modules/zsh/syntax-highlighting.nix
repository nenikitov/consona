{lib, ...} @ args: let
  libConsona = import ../../lib args;
  inherit (libConsona) semantic;
  inherit (libConsona.transform) ansi;
  highlights = {
    # TODO(nenikitov): Add `unknown-token`
    comment = [];
    literalText = ["autodirectory" "path" "path_prefix" "single-quoted-argument" "double-quoted-argument" "dollar-quoted-argument" "named-fd"];
    literalNumber = ["numeric-fd"];
    literalLanguage = [];
    literalEscape = ["globbing" "rc-quote" "back-double-quoted-argument" "back-dollar-quoted-argument"];
    typePrimitive = [];
    typeComplex = [];
    typeModule = [];
    functionNative = ["builtin" "function" "command" "history-expansion"];
    functionMeta = ["alias" "suffix-alias" "global-alias" "hashed-command"];
    variable = ["single-hyphen-option" "double-hyphen-option" "assign" "arg0" "default"];
    keywordLanguage = ["reserved-word" "precommand"];
    keywordOperator = ["commandseparator" "command-substitution-delimiter" "process-substitution-delimiter" "arithmetic-expansion" "back-quoted-argument-delimiter" "redirection"];
    keywordDelimiter = [];
  };
in
  libConsona.mkModule {
    name = ["zsh" "syntaxHighlighting"];
    nameHuman = "zsh syntax highlighting";
    cfg = {
      programs.zsh.syntaxHighlighting.styles =
        lib.foldlAttrs
        (
          acc: token: groups:
            acc
            // builtins.listToAttrs (
              builtins.map
              (g: {
                name = g;
                value = let
                  c = ansi semantic.code."${token}";
                  cString =
                    if builtins.isNull c
                    then "default"
                    else builtins.toString c;
                in "fg=${cString}";
              })
              groups
            )
        )
        {}
        highlights;
    };
  }
