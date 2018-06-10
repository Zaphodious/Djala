package com.blakwurm;

import haxe.ds.HashMap;
import DataClass;

using hx.strings.Strings;
using Type;

class ModularEntity implements DataClass {

    public var name: String;
    public var id: String;

    private var modules: Map<String, DataClass>;

    public function get<T: DataClass>(c: Class<T>) : T {
        return cast modules[c.getClassName()];
    }

    public function set<T: DataClass>(c: Class<T>, thing: T) : ModularEntity {
        modules.set(c.getClassName(), thing);
        return this;
    }
}