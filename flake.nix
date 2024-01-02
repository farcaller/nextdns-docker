{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      
      tini = pkgs.tini;
      nextdns = pkgs.nextdns;
    in
    {
      dockerImage = pkgs.dockerTools.buildImage {
        name = "ghcr.io/farcaller/nextdns-docker";
        tag = "latest";
        config = {
          Entrypoint = [ "${tini}/bin/tini" "--" "${nextdns}/bin/nextdns" ];
          Labels."org.opencontainers.image.source" = "https://github.com/farcaller/nextdns-docker";
        };
      };
      version = nextdns.version;
    }
  );
}
