let upstream-ps =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.15-20240416/packages.dhall
        sha256:ca727657c01cc31d0e79c2113b59126b9826f4b56d20a8193be3c725599fb754

let upstream-lua =
      https://github.com/Unisay/purescript-lua-package-sets/releases/download/psc-0.15.15-20240416/packages.dhall
        sha256:e68b7752ca4dee0f0578a2e40159caf6d1290a711777931b20d10d807823b52d

in  upstream-ps // upstream-lua
