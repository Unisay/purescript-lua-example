{ name = "purescript-lua-example"
, dependencies = [ "console", "effect", "lua-ngx", "prelude" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
, backend =
    ''
    pslua \
    --foreign-path foreign \
    --ps-output output \
    --lua-output-file web/main.lua \
    --entry Main.main
    ''
}
