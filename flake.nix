{
  description = "Nix utility to apply unified styled to various applications";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = {self, ...}: {
    homeManagerModule = import ./module.nix self;
  };
}
