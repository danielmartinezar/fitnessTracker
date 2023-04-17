// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actividad.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActividadAdapter extends TypeAdapter<Actividad> {
  @override
  final int typeId = 0;

  @override
  Actividad read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Actividad(
      tipo: fields[0] as String,
      cronometro: fields[1] as Duration,
      km: fields[2] as double,
      kcal: fields[3] as double,
      avgPace: fields[4] as double,
      estado: fields[5] as bool,
      fecha: fields[6] as DateTime,
      puntos: (fields[7] as List).cast<UserLocation>(),
    );
  }

  @override
  void write(BinaryWriter writer, Actividad obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.tipo)
      ..writeByte(1)
      ..write(obj.cronometro)
      ..writeByte(2)
      ..write(obj.km)
      ..writeByte(3)
      ..write(obj.kcal)
      ..writeByte(4)
      ..write(obj.avgPace)
      ..writeByte(5)
      ..write(obj.estado)
      ..writeByte(6)
      ..write(obj.fecha)
      ..writeByte(7)
      ..write(obj.puntos);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActividadAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
