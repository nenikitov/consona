args: let
  libConsona = import ../../lib args;
  inherit (libConsona) query;
in
  libConsona.mkModule {
    name = ["zsh" "syntaxHighlighting"];
    nameHuman = "zsh syntax highlighting";
    cfg = {
      programs.zsh.syntaxHighlighting.styles = {
      };
    };
  }
