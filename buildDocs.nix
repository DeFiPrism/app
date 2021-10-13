{ pkgs, src }:
pkgs.stdenv.mkDerivation {
  name = "DeFi-Prism-docs";
  inherit src;

  buildInputs = [ pkgs.mdbook ];

  installPhase = ''
    mkdir -p $out;
    mdbook build --dest-dir $out $src;
    '';
}
