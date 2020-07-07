// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet_reminder.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DietModelAdapter extends TypeAdapter<DietModel> {
  @override
  DietModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DietModel(
      dietName: fields[0] as String,
      time: (fields[1] as List)?.cast<int>(),
      startDate: fields[2] as DateTime,
      secondDietName: fields[3] as String,
      thirdDietName: fields[4] as String,
      secondTime: (fields[5] as List)?.cast<int>(),
      thirdTime: (fields[6] as List)?.cast<int>(),
      endDate: fields[7] as DateTime,
      id: fields[8] as String,
      description: fields[9] as String,
      foodClasses: (fields[10] as List)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, DietModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.dietName)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.startDate)
      ..writeByte(3)
      ..write(obj.secondDietName)
      ..writeByte(4)
      ..write(obj.thirdDietName)
      ..writeByte(5)
      ..write(obj.secondTime)
      ..writeByte(6)
      ..write(obj.thirdTime)
      ..writeByte(7)
      ..write(obj.endDate)
      ..writeByte(8)
      ..write(obj.id)
      ..writeByte(9)
      ..write(obj.description)
      ..writeByte(10)
      ..write(obj.foodClasses);
  }

  @override
  int get typeId => 1;
}
