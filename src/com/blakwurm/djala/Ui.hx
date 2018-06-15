package com.blakwurm.djala;

import com.blakwurm.djala.System;
import haxe.ui.Toolkit;
import haxe.ui.components.Button;
import haxe.ui.core.Screen;

class Ui implements SystemModule {
    public function preInit(system: System): Bool return true;
    public function init(system: System): Bool {
        Toolkit.init();

        return true;
    }
    public function postInit(system: System): Bool return true;
}