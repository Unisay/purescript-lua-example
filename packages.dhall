let upstream-ps =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.9-20230715/packages.dhall
        sha256:ca2801f7422d563de4ea4524efe6fa290186d202067409bc9cf359bb23acdfc5

let upstream-lua =
      https://github.com/Unisay/purescript-lua-package-sets/releases/download/psc-0.15.9-20230704/packages.dhall
        sha256:bca5a6cc5bd5c95040951d412f773ba56da3a381852d9ac1f1f333b2a93abb80

in  upstream-ps // upstream-lua
