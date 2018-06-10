package com.blakwurm;

import haxe.ds.HashMap;
import haxe.ds.Option;
import DataClass;

using hx.strings.Strings;
using Type;
using Map;
using dataclass.JsonConverter;

class ModularEntity implements DataClass {

    public var name: String;
    public var id: String;

    var modules: Map<String, DataClass> = new Map();

    public function get<T: DataClass>(c: Class<T>) : Null<T> {
        var foo = c.getClassName();
        return cast modules[c.getClassName()];
    }

    public function set<T: DataClass>(c: Class<T>, thing: T) : ModularEntity {
        var foo = c.getClassName();
        modules.set(c.getClassName(), thing);
        return this;
    }

    public function remove<T: DataClass>(c: Class<T>) : ModularEntity {
        modules.remove(c.getClassName());
        return this;
    }

    public static function copy<T: DataClass>(dataClass: T) : T {
        return Type.getClass(dataClass).fromJson(dataClass.toJson());
    }
}