package com.blakwurm.djala;

import com.blakwurm.ModularEntity;
import com.blakwurm.djala.GameEntity;
import com.blakwurm.djala.System;
using haxe.Json;


interface Registry {
    public var entities: Array<ModularEntity<GameEntityModule>>;
    public function find(id: String) : ModularEntity<GameEntityModule>;
    public function insert(thing: ModularEntity<GameEntityModule>) : Bool;
    public function delete(id: String) : Bool;
}

class AbstractRegistry implements Registry {
    public var entities: Array<ModularEntity<GameEntityModule>> = new Array();
    public function find(id: String) : ModularEntity<GameEntityModule> {return entities[0];}
    public function insert(thing: ModularEntity<GameEntityModule>) : Bool {
        entities.push(thing);
        return true;
        }
    public function delete(id: String) : Bool {return true;}
}



class DummyRegistry extends AbstractRegistry {
    public function new(n:String){}
}


class RegistrySystemModule implements SystemModule {
    @exclude public var store: Registry = new DummyRegistry("Dummy");

    @exclude public function preInit(system: System): Bool {
/*         trace("Making data store");
        this.store = new LocalRegistry(system.systemArgs.dbname);
        this.store.insert(GameEntity.initCharacter());
        this.store.insert(GameEntity.initCharacter());
        trace("Data store made");*/
        return true; 
    }
    @exclude public function init(system: System): Bool {return true;}
    @exclude public function postInit(system: System): Bool {return true;}
}



