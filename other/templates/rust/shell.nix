{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    rustc
    cargo
    rust-analyzer
    clippy
    rustfmt
    lldb
    pkg-config
  ];

  RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
  CARGO_HOME = "./.cargo";
  RUSTUP_HOME = "./.rustup";

  shellHook = ''
    echo "Rust development environment activated!"
    echo "Rust version: $(rustc --version)"
    echo "Cargo version: $(cargo --version)"
    echo "Available tools:"
    echo "  - rust-analyzer: $(which rust-analyzer || echo 'not found')"
    echo "  - clippy: $(which clippy-driver || echo 'not found')"
    echo "  - rustfmt: $(which rustfmt || echo 'not found')"
  '';
}