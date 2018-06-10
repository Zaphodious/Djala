package com.blakwurm.djala;

import tink.Cli;
import com.blakwurm.djala.Registry;

using Monsoon;

class Djala {
    public static function main() {
        Cli.process(Sys.args(), new Argo());//.handle(Cli.process);
    }
    var args: Argo;
    public var registry: Registry;

    public function new(argo: Argo) {
        args = argo;
    }

    public function init() {
        registry = new LocalRegistry(args.dbname);
        if (args.server) {new ServerCore(this).init();}

    }
    
}

class Argo {
    public function new() {}

        public var client: Bool = true;
        public var server: Bool = true;
        public var gui: Bool = true;
        public var dbname: String = "data";

        @:defaultCommand
        public function run() {
            new Djala(this).init();
        }
}

class ServerCore {

    var app = new Monsoon();
    var djala: Djala;

    public function new(djala: Djala) {
        this.djala = djala;
    }

    public function init() {

        app.route(
            '/',
            function (req, res) res.send('Hello World')
        );

        app.listen(3000);

    }
}