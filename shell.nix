let
  pkgs = import <nixpkgs> {};
  geodesyDevEnv = with pkgs; buildEnv {
    name = "geodesyDevEnv";
    paths = [
      awsEnv
      javaEnv
      typeScriptEnv
      graphviz
    ];
  };
in
  pkgs.runCommand "dummy" {
    buildInputs = [
      geodesyDevEnv
    ];
  } ""





