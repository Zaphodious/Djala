package com.blakwurm.djala;

import com.blakwurm.djala.Character;
import com.blakwurm.djala.Rulebook;
import DataClass;
import HaxeLow;


interface Registry {
    public var characters : TypeRegistry<Character>;
    public var rulebooks : TypeRegistry<Rulebook>;
}

class AbstractRegistry implements Registry {
    public var characters : TypeRegistry<Character> = new GenericTypeRegistry();
    public var rulebooks : TypeRegistry<Rulebook> = new GenericTypeRegistry();
}

class LocalRegistry extends AbstractRegistry {
    var db: HaxeLow;

    var lowCharacters: HaxeLowCol<Character, String>;
    var lowRulebooks: HaxeLowCol<Rulebook, String>;

    public function new(dbname: String) {
        db = new HaxeLow(dbname);
        lowCharacters = db.idCol(Character);
        lowRulebooks = db.idCol(Rulebook);
        characters.col = lowCharacters;
        rulebooks.col = lowRulebooks;
    }

    public function getCharacter(name: String) : Character {
        return new Character({name: "Hello"});
    }
}

interface TypeRegistry <T> {
    public var col: Array<T>;
    public function find(id: String) : T;
    public function insert(thing: T) : Bool;
    public function delete(id: String) : Bool;
}

class GenericTypeRegistry <T> implements TypeRegistry<T> {
    public function new() {}
    public var col: Array<T>;
    public function find(id: String) : T {return col[0];}
    public function insert(thing: T) : Bool {return true;}
    public function delete(id: String) : Bool {return true;}
}