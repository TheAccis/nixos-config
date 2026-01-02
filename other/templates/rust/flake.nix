{
	description = "Rust dev shell with wgpu (rust-src included)";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
		flake-utils.url = "github:numtide/flake-utils";
		rust-overlay.url = "github:oxalica/rust-overlay";
	};

	outputs = { self, nixpkgs, flake-utils, rust-overlay }:
		flake-utils.lib.eachDefaultSystem (system:
			let
				overlays = [ rust-overlay.overlays.default ];
				pkgs = import nixpkgs { inherit system overlays; };

				rust = pkgs.rust-bin.stable.latest.default.override {
					extensions = [
						"rust-src"
						"rustfmt"
						"clippy"
					];
				};
			in {
				devShells.default = pkgs.mkShell {
					buildInputs = [
						rust
						pkgs.rust-analyzer
						pkgs.pkg-config
						pkgs.lldb
					];

					shellHook = ''
						echo "🦀 Rust development environment activated!"
						echo "🦀 Rust: $(rustc --version)"
					'';
				};
			});
}