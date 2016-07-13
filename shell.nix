let
  pkgs = import <nixpkgs> {};
  geodesyDevEnv = with pkgs; buildEnv {
    name = "geodesyDevEnv";
    paths = [
      openjdk8
      maven
    ];
  };
in
  pkgs.runCommand "dummy" {
    buildInputs = [
      geodesyDevEnv
    ];
  } ""





