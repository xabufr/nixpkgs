{ callPackage, python3, lib, stdenv, openssl, enableNpm ? true }:

let
  buildNodejs = callPackage ./nodejs.nix {
    inherit openssl;
    python = python3;
  };
in
  buildNodejs {
    inherit enableNpm;
    version = "14.19.3";
    sha256 = "sha256-XPRbHxrKd1I6zzYkDB1TqZknkHCncR6r8jNG+IsMyZQ=";
    patches = lib.optional stdenv.isDarwin ./bypass-xcodebuild.diff;
  }
