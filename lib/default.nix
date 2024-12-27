args:
# TODO(nenikitov): Use pipe operators, probably like that
# []
#   |> builtins.map (m: import m args)
#   |> builtins.foldl' (acc: el: acc // el) {};
builtins.foldl'
(acc: el: acc // el)
{}
(
  builtins.map (m: import m args) [
    ./color.nix
    ./module.nix
    ./query.nix
    ./util.nix
  ]
)
