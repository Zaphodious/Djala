package com.blakwurm.anathema;

import com.blakwurm.djala.System;
import com.blakwurm.djala.Ui;

class AnathemaUI {
    public static function main() {
        trace("Starting thing!");
        var args = new SystemArgs(function (sys: System) {
            sys.modules.set(Ui, new Ui({}));
        });
        args.run();
        trace("Done Starting Thing!");
    }
}