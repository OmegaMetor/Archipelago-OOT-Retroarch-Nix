{
  description = "RetroArch shell with no cores";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    mupen64plus-core-custom.url = "github:JoshuaEagles/mupen64plus-libretro-nx";
    mupen64plus-core-custom.flake = false;
    client.url = "path:./client";
  };

  outputs = { self, nixpkgs, flake-utils, mupen64plus-core-custom, client }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
      };

      mupen64plus = pkgs.libretro.mupen64plus.overrideAttrs (old: {
        src = mupen64plus-core-custom;
      });

     myRetroarch = pkgs.wrapRetroArch {
    cores = [ mupen64plus ];
    settings = {
      network_cmd_enable = "true";
      # other config values here
    };
  };
        
        #pkgs.retroarch.withCores (cores: [ mupen64plus ]);

    in
    {
      packages = {
        retroarch = myRetroarch;
        client = client.packages.${system}.default;
      };
    });
}
