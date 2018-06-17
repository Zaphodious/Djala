package com.blakwurm.anathema;

import tink.Cli;
import com.blakwurm.djala.System;
import com.blakwurm.djala.Server;
import com.blakwurm.djala.Registry;
import com.blakwurm.djala.Ui;

class AnathemaCombo {
    public static function main() {
        trace("Starting thing!");
        Cli.process(Sys.args(), new SystemArgs(function (sys: System) {
            sys.modules.set(Ui, new Ui({}));
            sys.modules.set(ServerSystemModule, new ServerSystemModule({}));
            sys.modules.set(RegistrySystemModule, new RegistrySystemModule({}));
        }));
        trace("Done Starting Thing!");
    }
}