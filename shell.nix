{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    nativeBuildInputs = with pkgs.buildPackages; [
      go
      gofumpt
      air
    ];

    shellHook = ''
      if [ -f .env ]; then
        set -a
        source .env
        set +a
      fi

      export PATH=$PATH:$(go env GOPATH)/bin
    '';
}
