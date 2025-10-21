let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
  
  pkgs = import nixpkgs { overlays = [ (import "${fetchTarball "https://github.com/nix-community/fenix/archive/main.tar.gz"}/overlay.nix") ]; };
  
  goodRustToolchain = pkgs.fenix.stable.minimalToolchain;
  badRustToolchain = pkgs.fenix.stable.toolchain;
in
{
  packages.hello_world =
        (pkgs.makeRustPlatform {
          cargo = goodRustToolchain;
          rustc = goodRustToolchain;
        }).buildRustPackage {
          pname = "example";
          version = "0.1.0";

          src = ./.;

          cargoLock.lockFile = ./Cargo.lock;
        };

  packages.goodbye_world =
        (pkgs.makeRustPlatform {
          cargo = badRustToolchain;
          rustc = badRustToolchain;
        }).buildRustPackage {
          pname = "example";
          version = "0.1.0";

          src = ./.;

          cargoLock.lockFile = ./Cargo.lock;
        };
}