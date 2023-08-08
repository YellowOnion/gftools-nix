{ config, lib, pkgs, ... }:
let
  pname = "gftools";
  version = "0.9.33";
  pPkgs = pkgs.python3.pkgs;
in
pPkgs.buildPythonApplication {
  inherit pname version;
  format = "pyproject";

  nativeBuildInputs = [ pPkgs.setuptools pPkgs.skia-pathops
                        # add more dependencies
                      ];

  src = pkgs.fetchPypi {
    inherit pname version;
    hash =   "sha256-B9F5ZIXELzXN4X6e6ZXjMwp1nnLPMXU8pJwhzNz0SwM=";
  };
}
