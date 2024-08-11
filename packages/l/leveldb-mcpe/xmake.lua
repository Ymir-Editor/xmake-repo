package("leveldb-mcpe")
    set_description("A fork of LevelDB with MCPE support")
    set_license("BSD-3-Clause")
    add_urls("https://github.com/Amulet-Team/leveldb-mcpe/archive/$(version).tar.gz", "https://github.com/Amulet-Team/leveldb-mcpe.git")
    add_version("1.22", "8a0ef86d187fe4846c797ef0a4aa68b0f9658dc3")
    add_deps("cmake")
    add_deps("snappy")
    add_deps("zlib")
    if is_plat("linux") then
        add_syslinks("pthread")
    end

    on_install("macosx", "linux", "windows", "mingw", function (package)
        local configs = {"-DLEVELDB_BUILD_TESTS=OFF", "-DLEVELDB_BUILD_BENCHMARKS=OFF"}
        table.insert(configs, "-DCMAKE_BUILD_TYPE=" .. (package:debug() and "Debug" or "Release"))
        table.insert(configs, "-DBUILD_SHARED_LIBS=" .. (package:config("shared") and "ON" or "OFF"))
        import("package.tools.cmake").install(package, configs)
    end)

    on_test(function (package)
        assert(package:check_cxxsnippets({test = [[
            void test() {
                leveldb::DB* db;
                leveldb::Options options;
                options.create_if_missing = true;
                leveldb::Status status = leveldb::DB::Open(options, "./test", &db);
            }
        ]]}, {configs = {languages = "c++11"}, includes = "leveldb/db.h"}))
    end)

-- 8a0ef86d187fe4846c797ef0a4aa68b0f9658dc3