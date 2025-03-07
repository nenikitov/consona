{lib, ...} @ args:
lib.pipe
[
  ./color.nix
  ./font.nix
  ./script.nix
  ./target.nix
  ./util.nix
]
[
  (builtins.map (m: import m args))
  (builtins.foldl' lib.recursiveUpdate {})
]
