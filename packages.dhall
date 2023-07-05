let upstream-ps =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.9-20230629/packages.dhall
        sha256:f91d36c7e4793fe4d7e042c57fef362ff3f9e9ba88454cd38686701e30bf545a

let upstream-lua =
      https://github.com/Unisay/purescript-lua-package-sets/releases/download/psc-0.15.9-20230704/packages.dhall
        sha256:bca5a6cc5bd5c95040951d412f773ba56da3a381852d9ac1f1f333b2a93abb80

in  upstream-ps // upstream-lua
