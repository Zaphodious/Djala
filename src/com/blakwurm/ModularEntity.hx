package com.blakwurm;

import DataClass;
import HaxeLow;

using Type;
using dataclass.JsonConverter;

class ModularEntity implements DataClass {

    public var name: String;
    public var id: String = HaxeLow.uuid();

    public var modules: Map<String, Module> = new Map();

    public function get<T: Module>(c: Class<T>) : Null<T> {
        return cast modules[c.getClassName()];
    }

    public function set<T: Module>(c: Class<T>, thing: T) : ModularEntity {
        modules.set(c.getClassName(), thing);
        return this;
    }

    public function remove<T: Module>(c: Class<T>) : ModularEntity {
        modules.remove(c.getClassName());
        return this;
    }

    public function toString() : String {
        return cast( this.toJson() );
    }

    
}

interface Module extends DataClass {
}
