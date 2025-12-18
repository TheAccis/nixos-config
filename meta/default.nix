{ pkgs, lib, config }:
let
  files = [
    ./directories.nix
    ./apps.nix
  ];
  
  importedFiles = map (path: import path { inherit pkgs lib config; }) files;
in
  lib.foldl' lib.recursiveUpdate {} importedFiles