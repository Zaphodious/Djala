clean:
    rm bin/

test-neko:
    haxe build-neko.hxml
    neko bin/Djala.n

test-js:
    haxe build-js.hxml

test-cpp:
    haxe build-cpp.hxml

test-munit:
    haxe build-munit.hxml

install:
    haxelib install build-neko.hxml
    haxelib install build-js.hxml
    haxelib install build-cpp.hxml
    haxelib install build-munit.hxml

