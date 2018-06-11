package com.blakwurm;

import haxe.ds.HashMap;
import haxe.ds.Option;
import DataClass;

using hx.strings.Strings;
using Type;
using dataclass.JsonConverter;

class ModularEntity implements DataClass {

    public var name: String;
    public var id: String;

    //@include 
    public var modules: Map<String, IModule> = new Map();

    public function get<T: DataClass>(c: Class<T>) : Null<T> {
        var foo = c.getClassName();
        return cast modules[c.getClassName()];
    }

    public function set<T: IModule>(c: Class<T>, thing: T) : ModularEntity {
        var foo = c.getClassName();
        modules.set(c.getClassName(), thing);
        return this;
    }

    public function remove<T: IModule>(c: Class<T>) : ModularEntity {
        modules.remove(c.getClassName());
        return this;
    }

    public function toString() : String {
        return cast( this.toJson() );
    }

    
}

interface IModule extends DataClass {
}
