package com.blakwurm.djala;

import com.blakwurm.ModularEntity;
import com.blakwurm.djala.GameEntity;
import DataClass;

class System {
    public var modules: ModularEntity<SystemModule> = new ModularEntity({name: "System"});
    public var systemArgs: SystemArgs = new SystemArgs(function (a: System) {});
    public function new() {}

    public function AddArgs(args: SystemArgs) : System {
        this.systemArgs = args;
        return this;
    }

    public function runSetupFunction(setup: (System) -> Void) : System {
        setup(this);
        return this;
    }

    public function init() {
        for (sm in modules.iterator()) {
            sm.preInit(this);
        }
        for (sm in modules.iterator()) {
            sm.init(this);
        }
    }
}

class SystemArgs {
    public function new(setup: (System) -> Void) {
        systemSetup = setup;
    }
    public var client: Bool = true;
    public var server: Bool = false;
    public var headless: Bool = false;
    public var mobile: Bool = false;
    public var dbname: String = "data";
    private var systemSetup: (System) -> Void;

    @:defaultCommand
    public function run() {
        trace("Setting up the system!");
        new System().AddArgs(this).runSetupFunction(systemSetup).init();
        trace("System is done setting up!");

    }
}

interface SystemModule extends Module {
    public function preInit(system: System): Bool;
    public function init(system: System): Bool;
    public function postInit(system: System): Bool;
}
