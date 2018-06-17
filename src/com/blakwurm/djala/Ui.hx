package com.blakwurm.djala;

import com.blakwurm.djala.System;
import com.blakwurm.djala.Registry;
import haxe.ui.HaxeUIApp;
import haxe.ui.Toolkit;
import haxe.ui.components.Button;
import haxe.ui.core.Component;
import haxe.ui.core.Screen;
import haxe.ui.macros.ComponentMacros;

class Ui implements SystemModule {
    private var app : HaxeUIApp;
    public function preInit(system: System): Bool {
        if (!system.systemArgs.headless) {
            Toolkit.init();
            app = new HaxeUIApp();
            
        }
        return true;
    }
    public function init(system: System): Bool {
        if (!system.systemArgs.headless) {
            var main:Component = ComponentMacros.buildComponent("resources/ui/shell.xml");
            app.addComponent(main);
        }
        return true;
    }
    public function postInit(system: System): Bool return true;
}