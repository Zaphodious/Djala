package com.blakwurm;

import DataClass;

using Type;
using dataclass.JsonConverter;
using haxe.Json;
using com.blakwurm.DataClassExt;

class ModularEntity<M: Module> implements DataClass {

    /**
     *  Human-readable entity name. Not used as a unique identifier.
     */
    public var name: String;

    /**
     *  Unique string, used to identify the entity.
     */
    public var id: String = "" + Std.random(999999);

    /**
     *  Exposed publically for the benefit of serialiation. This SHOULD NOT be accessed on its own, as type safety is not guarantted.
     */
    public var __modules: Map<String, Module> = new Map();

    public function get<T: M>(c: Class<T>) : Null<T> {
        return cast __modules[c.getClassName()];
    }

    public function set<T: M>(c: Class<T>, thing: T) : ModularEntity<M> {
        __modules.set(c.getClassName(), thing);
        return this;
    }

    public function remove<T: M>(c: Class<T>) : ModularEntity<M> {
        __modules.remove(c.getClassName());
        return this;
    }

    public function iterator() : Iterator<M> {
        return cast __modules.iterator();
    }

    public function toString() : String {
        return this.toJsonString();
    }
    
}

interface Module extends DataClass {
}

class AbstractModule implements Module {
}