package com.blakwurm;

using haxe.Json;
using Type;
using dataclass.JsonConverter;


class DataClassExt {
    public static function toJsonString<T: DataClass>(dataClass: T) : String {
        return dataClass.toJson().stringify();
    }

    public static function fromJsonString<T: DataClass>(dc: Class<T>, jsonString: String) : T {
        return dc.fromJson(jsonString.parse());
    }

    public static function copy<T: DataClass>(dataClass: T) : T {
        return fromJsonString(Type.getClass(dataClass), toJsonString(dataClass));
        //Type.getClass(dataClass).fromJson(dataClass.toJson().stringify().parse());
    }
}