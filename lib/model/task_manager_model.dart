import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class TaskManagerModel {
  @HiveField(0)
  String taskname;
  @HiveField(1)
  String date;
  @HiveField(2)
  String discription;

  TaskManagerModel({
    required this.date,
    required this.taskname,
    required this.discription,
  });
}