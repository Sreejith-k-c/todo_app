import 'package:hive/hive.dart';
import 'package:todo_app/model/task_manager_model.dart';

class TaskManagerModelAdapter extends TypeAdapter<TaskManagerModel> {
  @override
  final int typeId = 1;

  @override
  TaskManagerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskManagerModel(
      date: fields[1] as String,
      taskname: fields[0] as String,
      discription: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TaskManagerModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.taskname)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.discription);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskManagerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}