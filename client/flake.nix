{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    client = {
      url = "github:JoshuaEagles/Archipelago.RetroArchClient";
      flake = false;
    };
  };
  outputs = {
    nixpkgs,
    flake-utils,
    client,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
        projectFile = "Archipelago.RetroArchClient/Archipelago.RetroArchClient.csproj";
        dotnet-sdk = pkgs.dotnet-sdk_8;
        dotnet-runtime = pkgs.dotnetCorePackages.runtime_8_0;
        version = "0.0.1";
      in {
        packages = {
          default = pkgs.buildDotnetModule {
            inherit projectFile dotnet-sdk dotnet-runtime;
            pname = "Archipelago.RetroArchClient";
            version = version;
            src = client;
            nugetDeps = ./deps.json; # run `nix build .#default.passthru.fetch-deps && ./result` and put the result here
            doCheck = true;
          };
        };
        devShells = {
          default = pkgs.mkShell {
            buildInputs = [dotnet-sdk pkgs.git];
          };
        };
      }
    );
}
