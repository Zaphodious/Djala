package com.blakwurm;

using haxe.Json;
using Type;
using dataclass.JsonConverter;


class DataClassExt {
    public static function copy<T: DataClass>(dataClass: T) : T {
        return Type.getClass(dataClass).fromJson(dataClass.toJson().stringify().parse());
    }
}