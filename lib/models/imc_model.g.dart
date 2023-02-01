// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imc_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImcModelAdapter extends TypeAdapter<ImcModel> {
  @override
  final int typeId = 0;

  @override
  ImcModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImcModel()
      .._nome = fields[0] as String
      .._genero = fields[1] as String
      .._altura = fields[2] as double
      .._peso = fields[3] as int
      .._idade = fields[4] as int
      .._imc = fields[5] as double
      .._status = fields[6] as String;
  }

  @override
  void write(BinaryWriter writer, ImcModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj._nome)
      ..writeByte(1)
      ..write(obj._genero)
      ..writeByte(2)
      ..write(obj._altura)
      ..writeByte(3)
      ..write(obj._peso)
      ..writeByte(4)
      ..write(obj._idade)
      ..writeByte(5)
      ..write(obj._imc)
      ..writeByte(6)
      ..write(obj._status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImcModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
