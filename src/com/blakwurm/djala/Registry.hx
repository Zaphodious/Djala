package com.blakwurm.djala;

import com.blakwurm.ModularEntity;
import HaxeLow;
import com.blakwurm.djala.GameEntity;
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

class LocalRegistry extends AbstractRegistry {
    var db: HaxeLow;
    var lowEntities: Array<ModularEntity<GameEntityModule>> = new Array();

    public function new(dbname: String) {
        db = new HaxeLow(dbname);
        lowEntities = db.idCol(ModularEntity);
        this.entities = lowEntities;
    }
    override public function insert(thing: ModularEntity<GameEntityModule>) : Bool {
        super.insert(thing);
        db.save();
        return true;
    }
}

class FileRegistry extends AbstractRegistry {
    var filename: String;

    public function new(dbname: String) {
        filename = dbname + ".djala";
    }

    override public function insert(thing: ModularEntity<GameEntityModule>) : Bool {
        var result = super.insert(thing);
        sys.io.File.saveContent(filename, entities.stringify());
        return result;
    }
}

class DummyRegistry extends AbstractRegistry {
    public function new(n:String){}
}