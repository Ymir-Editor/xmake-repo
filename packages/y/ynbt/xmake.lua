package("ynbt")
    set_description("The ynbt package")
    add_deps("abseil")
    add_deps("zlib")

    add_urls("https://github.com/Ymir-Editor/YNBT.git")
    add_versions("1.0", "9bb4b59214607ff9bd269c6e3885c067fe1369bd")

    on_install(function (package)
        local configs = {}
        if package:config("shared") then
            configs.kind = "shared"
        end
        import("package.tools.xmake").install(package, configs)
    end)

