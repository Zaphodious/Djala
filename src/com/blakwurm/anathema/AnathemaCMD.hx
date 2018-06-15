package com.blakwurm.anathema;

import tink.Cli;
import com.blakwurm.djala.System;

class AnathemaCMD {
    public static function main() {
        trace("Starting thing!");
        Cli.process(Sys.args(), new SystemArgs(function (sys: System) {
        }));
        trace("Done Starting Thing!");
    }
}