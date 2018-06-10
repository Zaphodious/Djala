package com.blakwurm.djala;

import DataClass;
import HaxeLow;

class Character implements DataClass{
    public var id: String = HaxeLow.uuid();
    public var name: String;
    public var type: String = "Solar";
    public var subtype: String = "Zenith";
    public var rulebooks: Array<String> = ["core"];
    public var image: String = "";
    public var attributes: Map<String, Int> = new Map<String, Int>();
    public var abilities: Map<String, Int> = new Map<String, Int>();
    public var castables: Array<CastableRef> = [new CastableRef({name: "Ox Body"})];
    public var merits: Array<MeritRef> = [new MeritRef({name: "Wealth", rank: 2})];
    public var health: HealthTrack = new HealthTrack({});
}

/*  */


private class ARuleRef {
    public var name: String;
    public var rulebook: String = "core";
}

class CastableRef extends ARuleRef implements DataClass {
    public var type: String = "Charm";
}

class MeritRef extends ARuleRef implements DataClass {
    public var rank: Int = 1;
}

private class HealthTrack implements DataClass {
    public var zero: Int = 1;
    public var one: Int = 2;
    public var two: Int = 3;
    public var four: Int = 2;
    public var bashing: Int = 0;
    public var lethal: Int = 0;
    public var aggrevated: Int = 0;
}