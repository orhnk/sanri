{
  description = "Flutter 3.13.x";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    android-nixpkgs = {
      url = "github:tadfisher/android-nixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    android-nixpkgs,
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

      android-pkgs = import android-nixpkgs {
        inherit system;
      };

      jdk-custom = pkgs.jdk17;
      android-sdk-custom = android-pkgs.sdk (sdkPkgs:
        with sdkPkgs; [
          # List options: `nix flake show github:tadfisher/android-nixpkgs`
          cmdline-tools-latest
          build-tools-34-0-0
          platform-tools
          platforms-android-34
          system-images-android-24-google-apis-x86
          emulator
        ]);
    in {
      devShell = with pkgs;
        mkShell rec {
          # JAVA_HOME = jdk-custom;
          # ANDROID_HOME = "${android-sdk-custom}/share/android-sdk";
          # ANDROID_SDK_HOME = "${android-sdk-custom}/share/android-sdk"; # Deprecated Use ANDROID_HOME instead
          # ANDROID_SDK_ROOT = "${android-sdk-custom}/share/android-sdk";
          # ANDROID_SDK_ROOT = "${android-sdk-custom}/libexec/android-sdk";
          CHROME_EXECUTABLE = "${pkgs.chromium}/bin/chromium";
          buildInputs = [
            flutter
            android-sdk-custom
            jdk-custom
            gradle
          ];
        };
    });
}
