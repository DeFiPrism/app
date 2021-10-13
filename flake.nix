{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-21.05";
    flake-utils.url = "github:numtide/flake-utils/master";
  };

  outputs = args @ {self, ...}:
    args.flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = self.inputs.nixpkgs.legacyPackages.${system};
      buildDocs = import ./buildDocs.nix;
      docServer = import ./docServer.nix;
    in
    rec {
      packages = self.inputs.flake-utils.lib.flattenTree rec {
        # TODO: create some cool stuff that works
      };

      app.serveDocs = docServer {
        inherit pkgs;

        builtDocsDir = buildDocs {
          inherit pkgs;
          src = ./doc;
        };
      };

      defaultApp = app.serveDocs;
    }
  );
}
