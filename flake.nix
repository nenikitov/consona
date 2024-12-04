{
  description = "Nix utility to apply unified styled to various applications";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = {self, ...}: {
    lib = import ./lib;
    homeManagerModule = import ./module.nix {
      libStyler = self.lib;
    };
  };
}
