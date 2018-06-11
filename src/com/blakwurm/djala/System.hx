package com.blakwurm.djala;

import com.blakwurm.ModularEntity;
import com.blakwurm.djala.Registry;
import DataClass;

class System implements DataClass {
    public var modules: ModularEntity = new ModularEntity({name: "System"});

    public function new() {
        modules.set(RegistrySystemModule, new RegistrySystemModule({store: new LocalRegistry({})}));
    }
}

class RegistrySystemModule implements Module {
    public var store: Registry;
}

class ServerSystemModule implements Module {
    
}