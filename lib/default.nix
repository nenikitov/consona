{lib, ...} @ args:
lib.pipe
[
  ./color.nix
  ./module.nix
  ./util.nix
  ./script.nix
]
[
  (builtins.map (m: import m args))
  (builtins.foldl' (acc: el: acc // el) {})
]
