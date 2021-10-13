{ pkgs, builtDocsDir }:
pkgs.stdenv.mkDerivation {
  name = "DeFi-Prism-doc-server";

  src = builtDocsDir;

  buildInputs = [ pkgs.mdbook ];

  installPhase = ''
    mkdir -p $out/bin;
    echo $(printf '${pkgs.simple-http-server}/bin/simple-http-server -i -- %s' $src) > $out/bin/DeFi-Prism-doc-server;
    chmod +x $out/bin/DeFi-Prism-doc-server;
    '';
}
