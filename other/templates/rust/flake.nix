{
	description = "Rust development environment";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11?shallow=1";
		flake-utils.url = "github:numtide/flake-utils";
	};

	outputs = { self, nixpkgs, flake-utils }:
		flake-utils.lib.eachDefaultSystem (system:
			let
				pkgs = nixpkgs.legacyPackages.${system};
			in {
				devShells.default = pkgs.mkShell {
					buildInputs = with pkgs; [
						rustc
						cargo
						rust-analyzer
						clippy
						rustfmt
						lldb
					];

					RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
					shellHook = ''
						echo "🦀 Rust development environment activated!"
					'';
				};
			});
}