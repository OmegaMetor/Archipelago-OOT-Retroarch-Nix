{
  description = "RetroArch shell with no cores";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    client.url = "path:./client";
  };

  outputs = { self, nixpkgs, flake-utils, client }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
      };

     myRetroarch = pkgs.wrapRetroArch {
       cores = [ pkgs.libretro.mupen64plus ];
       settings = {
         network_cmd_enable = "true";
         # other config values here
       };
     };
    in
    {
      packages = {
        retroarch = myRetroarch;
        client = client.packages.${system}.default;
      };
    });
}
