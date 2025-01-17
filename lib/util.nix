{lib, ...}: {
  mkIfElse = cond: t: f: lib.mkMerge [(lib.mkIf cond t) (lib.mkIf (!cond) f)];
}
