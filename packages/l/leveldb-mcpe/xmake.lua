package("leveldb-mcpe")
    set_description("A fork of LevelDB with MCPE support")
    set_license("BSD-3-Clause")
    add_urls("https://github.com/Ymir-Editor/leveldb-mcpe-ymir/releases/download/aaaaaaaa/leveldb-mcpe-win-x86_64.zip")
    add_versions("1.22", "c9274248529087cb15d596265de57b870e4eb265")
    add_deps("cmake")
    add_deps("snappy")
    add_deps("zlib")
    if is_plat("linux") then
        add_syslinks("pthread")
    end

    on_install("macosx", "linux", "windows", "mingw", function (package)
        os.cp("*", package:installdir())
    end)
