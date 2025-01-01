{lib, ...} @ args: let
  libConsona = import ../../lib args;
  inherit (libConsona) semantic;
  inherit (libConsona.transform) ansi;

  zshHighlight = {
    color,
    bold,
    italic,
  }:
    builtins.concatStringsSep "," (builtins.filter (e: !builtins.isNull e) [
      "fg=${
        let
          c = ansi color;
        in
          if builtins.isNull c
          then "none"
          else builtins.toString c
      }"
      (
        if bold
        then "bold"
        else null
      )
      # NOTE: zsh doesn't support italic yet, but whenever they do this might "just work"
      # Anyway it sanitizes the input and discards it
      # https://github.com/zsh-users/zsh-syntax-highlighting/issues/432
      (
        if italic
        then "italic"
        else null
      )
    ]);

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
                value = zshHighlight semantic.code."${token}";
              })
              groups
            )
        )
        {}
        highlights;
    };
  }
