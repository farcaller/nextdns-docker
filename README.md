# nextdns-docker

A minimalistic docker container for nextdns that's updated nightly and will
track the latest release from nixpkgs.

Usage

```
docker run ghcr.io/farcaller/nextdns-docker:latest ...
```

The entrypoint specifies the path to nextdns already and it's better not to
modify it, as that path is unstable and unique to every build.
