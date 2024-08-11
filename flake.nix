{
  description = "Flutter 3.13.x";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        config = {
          android_sdk.accept_license = true;
          allowUnfree = true;
        };
      };
    in {
      devShell = with pkgs;
        mkShell rec {
          ANDROID_SDK_ROOT = "${androidenv.androidPkgs_9_0.androidsdk}/libexec/android-sdk";
          buildInputs = [
            flutter
            androidenv.androidPkgs_9_0.androidsdk
            jdk17
          ];
          shellHook = ''
            # Set the default shell
            export SHELL=$(getent passwd $USER | cut -d: -f7)
            exec "$SHELL"
          '';
        };
    });
}
