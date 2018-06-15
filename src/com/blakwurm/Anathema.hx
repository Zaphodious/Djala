package com.blakwurm;

import tink.Cli;
import com.blakwurm.djala.System;
import com.blakwurm.djala.Ui;

class Anathema {
    public static function main() {
        trace("Starting thing!");
        Cli.process(Sys.args(), new SystemArgs(function (sys: System) {
            sys.modules.set(Ui, new Ui({}));
        }));
        trace("Done Starting Thing!");
    }
}