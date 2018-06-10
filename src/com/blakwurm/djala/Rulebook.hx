package com.blakwurm.djala;

import DataClass;
import HaxeLow;

class Rulebook implements DataClass {
    public var id: String = HaxeLow.uuid();
    public var name: String;
}