package com.blakwurm.djala;

import com.blakwurm.ModularEntity;

class GameEntity {
    public static function initCharacter() : ModularEntity<GameEntityModule> {
        var character = new ModularEntity({name: "Unnamed"});
        character
                .set(HealthTrack, new HealthTrack())
                .set(CharacterModule, new CharacterModule());
        return character;
    }

    public static function initRulebook() : ModularEntity<GameEntityModule> {
        var rulebook = new ModularEntity({name: "Unnamed"});
        return rulebook;
    }
}

interface GameEntityModule extends Module {}

class HealthTrack implements GameEntityModule {
    public var zero: Int = 1;
    public var one: Int = 2;
    public var two: Int = 3;
    public var four: Int = 2;
    public var bashing: Int = 0;
    public var lethal: Int = 0;
    public var aggrevated: Int = 0;
}

class CharacterModule implements GameEntityModule {
    public var player: String = "Zaphodious";
    public var type: String = "Solar";
    public var rulebooks: Array<String> = ["core"];
    public var image: String = "";
}

class SolarModule implements GameEntityModule {
    public var caste: String;
    public var supernal: String;
    public var favored: Array<String>;
}

class StatModule implements GameEntityModule {
    public var attributes: Map<String, Int> = new Map<String, Int>();
    public var abilities: Map<String, Int> = new Map<String, Int>();
}

class CasterModule implements GameEntityModule {
    public var castables: Array<CastableRef> = [];
}

class MeritModule implements GameEntityModule {
    public var merits: Array<MeritRef> = [];
}

class ARuleRef {
    public var name: String;
    public var rulebook: String = "core";
}

class CastableRef extends ARuleRef implements DataClass {
    public var type: String = "Charm";
}

class MeritRef extends ARuleRef implements DataClass {
    public var rank: Int = 1;
}