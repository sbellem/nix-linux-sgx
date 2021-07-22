let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { };
  
  sgx = with pkgs; {
    sgx-sdk = callPackage ./sdk.nix { };

    ipp-crypto = callPackage ./ipp.nix { };
    #ipp-crypto-with-load-mitigation = ipp-crypto.override {
    ipp-crypto-with-load-mitigation = callPackage ./ipp.nix {
      mitigation = "LOAD";
    };
    #ipp-crypto-with-branch-mitigation = ipp-crypto.override {
    ipp-crypto-with-branch-mitigation = callPackage ./ipp.nix {
      mitigation = "CF";
    };

    sgx-ae = callPackage ./ae.nix { };
  };
in sgx
