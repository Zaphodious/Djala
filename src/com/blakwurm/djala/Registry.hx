package com.blakwurm.djala;

import com.blakwurm.ModularEntity;
import HaxeLow;


interface Registry extends DataClass {
    public var entities: Array<ModularEntity>;
    public function find(id: String) : ModularEntity;
    public function insert(thing: ModularEntity) : Bool;
    public function delete(id: String) : Bool;
}

class AbstractRegistry implements Registry {
    public var entities: Array<ModularEntity> = new Array();
    public function find(id: String) : T {return entities[0];}
    public function insert(thing: T) : Bool {return true;}
    public function delete(id: String) : Bool {return true;}
}

class LocalRegistry extends AbstractRegistry {
    var db: HaxeLow;
    var lowEntities: Array<ModularEntity> = new Array();

    public function new(dbname: String) {
        db = new HaxeLow(dbname);
        lowEntities = db.idCol(ModularEntity);
        this.entities = lowEntities;
    }
}