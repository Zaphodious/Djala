package com.blakwurm.djala;

import com.blakwurm.djala.System;

class ServerSystemModule implements SystemModule {
    public var name: String = "Server";
    @exclude var monsoon: Monsoon;

    @exclude public function preInit(system: System): Bool {return true;}
    @exclude public function init(system: System): Bool {
        var isServer = system.systemArgs.server;
        if (isServer) {
            monsoon = new Monsoon();
            trace("Server module booting!");
            monsoon.route(
                '/',
                function (req, res) res.send('Hello World')
        );

        monsoon.listen(15000);
        trace("Server module has booted!");
        }
         
        return true;
    }
    @exclude public function postInit(system: System): Bool {return true;}
}