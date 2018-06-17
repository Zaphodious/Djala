package com.blakwurm.anathema;

import com.blakwurm.djala.System;
import com.blakwurm.djala.Ui;
import com.blakwurm.djala.Registry;

class AnathemaUI {
    public static function main() {
        trace("Starting thing!");
        var args = new SystemArgs(function (sys: System) {
            sys.modules.set(Ui, new Ui({}));
            sys.modules.set(RegistrySystemModule, new RegistrySystemModule({}));
        });
        //args.mobile = true;
        args.run();
        trace("Done Starting Thing!");
    }
}