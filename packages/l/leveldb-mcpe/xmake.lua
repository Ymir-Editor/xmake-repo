package("leveldb-mcpe")
    set_description("A fork of LevelDB with MCPE support")
    set_license("BSD-3-Clause")
    add_urls("https://github.com/Ymir-Editor/leveldb-mcpe-ymir/releases/download/aaaaaaaa/leveldb-mcpe-win-x86_64.zip")
    add_versions("1.22", "cccd8703f13983a95cdc796100de328c75c85ccfdece450d23b2fe055aecdaac")
    add_deps("cmake")
    add_deps("snappy")
    add_deps("zlib")
    if is_plat("linux") then
        add_syslinks("pthread")
    end

    on_install("windows", function (package)
        os.cp("*", package:installdir())
    end)
