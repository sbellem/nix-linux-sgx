let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { };
  sgxcache = import sources.sgx;
  
  sgx = with pkgs; {
    sgx-sdk = callPackage ./sdk.nix { ippcrypto = sgxcache.ipp-crypto; };
    ipp-crypto = callPackage ./ipp.nix { };
    sgx-ae = callPackage ./ae.nix { };
  };
in sgx
