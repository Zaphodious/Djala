package com.blakwurm;

import DataClass;
import HaxeLow;

using Type;
using dataclass.JsonConverter;

class ModularEntity implements DataClass {

    /**
     *  Human-readable entity name. Not used as a unique identifier.
     */
    public var name: String;

    /**
     *  Unique string, used to identify the entity.
     */
    public var id: String = HaxeLow.uuid();

    /**
     *  Exposed publically for the benefit of serialiation. This SHOULD NOT be accessed on its own.
     */
    public var __modules: Map<String, Module> = new Map();

    public function get<T: Module>(c: Class<T>) : Null<T> {
        return cast __modules[c.getClassName()];
    }

    public function set<T: Module>(c: Class<T>, thing: T) : ModularEntity {
        __modules.set(c.getClassName(), thing);
        return this;
    }

    public function remove<T: Module>(c: Class<T>) : ModularEntity {
        __modules.remove(c.getClassName());
        return this;
    }

    public function toString() : String {
        return cast( this.toJson() );
    }

    
}

interface Module extends DataClass {
    public function preAdd(entity: ModularEntity) : Bool
}

class AbstractModule implements Module {
    public function preAdd(entity: ModularEntity) : Bool {
        return true
    }
}