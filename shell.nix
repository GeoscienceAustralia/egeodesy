let
  defaultPkgs = import <nixpkgs> {};
  pinnedPkgs = import (defaultPkgs.fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs-channels";
    rev = "f0fac3b578086066b47360de17618448d066b30e"; # 17 April 2017
    sha256 = "1mpwdminwk1wzycwmgi2c2kwpbcfjwmxiakn7bmvvsaxb30gwyyb";
  }) {};

in

{ nixpkgs ? pinnedPkgs }:

let
  pkgs = if nixpkgs == null then defaultPkgs else pinnedPkgs;
  devEnv = with pkgs; buildEnv {
    name = "devEnv";
    paths = [
      awscli
      chromium
      doxygen
      graphviz
      maven3
      nodejs-6_x
      openjdk8
      packer
      plantuml
      python3
      pythonPackages.credstash
      pythonPackages.docker_compose
      travis
      xvfb_run
    ];
  };
in
  pkgs.runCommand "setupEnv" {
    buildInputs = [
      devEnv
    ];
    shellHook = ''
      export PATH="$(pwd)/../gnss-site-manager/node_modules/.bin:$PATH"
    '';
  } ""
