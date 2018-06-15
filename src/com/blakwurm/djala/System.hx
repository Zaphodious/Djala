package com.blakwurm.djala;

import com.blakwurm.ModularEntity;
import com.blakwurm.djala.Registry;
import com.blakwurm.djala.GameEntity;
import DataClass;

using Monsoon;

class System {
    public var modules: ModularEntity<SystemModule> = new ModularEntity({name: "System"});
    public var systemArgs: SystemArgs = new SystemArgs(function (a: System) {});
    public function new() {}

    public function populateWithDefaults() : System {
        modules.set(RegistrySystemModule, new RegistrySystemModule({}))
               .set(ServerSystemModule, new ServerSystemModule({}));
        return this;
    }

    public function AddArgs(args: SystemArgs) : System {
        this.systemArgs = args;
        return this;
    }

    public function runSetupFunction(setup: (System) -> Void) : System {
        setup(this);
        return this;
    }

    public function init() {
        populateWithDefaults();
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
    public var server: Bool = true;
    public var gui: Bool = true;
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

class RegistrySystemModule implements SystemModule {
    @exclude public var store: Registry = new DummyRegistry("Dummy");

    @exclude public function preInit(system: System): Bool {
        trace("Making data store");
        this.store = new LocalRegistry(system.systemArgs.dbname);
        this.store.insert(GameEntity.initCharacter());
        this.store.insert(GameEntity.initCharacter());
        trace("Data store made");
        return true;
    }
    @exclude public function init(system: System): Bool {return true;}
    @exclude public function postInit(system: System): Bool {return true;}
}

class ServerSystemModule implements SystemModule {
    public var name: String = "Server";
    @exclude var monsoon: Monsoon = new Monsoon();

    @exclude public function preInit(system: System): Bool {return true;}
    @exclude public function init(system: System): Bool {
        trace("Server module booting!");
        monsoon.route(
            '/',
            function (req, res) res.send('Hello World')
        );

        monsoon.listen(15000);
        trace("Server module has booted!");
        return true;
    }
    @exclude public function postInit(system: System): Bool {return true;}
}

