// ignore_for_file: sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'json_gen/new_task.g.dart';

@JsonSerializable()
class NewTask {
  String title;
  int isCompleted;
  String dueDate;
  String comments;
  String description;
  String tags;

  NewTask({
    required this.title,
    required this.isCompleted,
    required this.dueDate,
    required this.comments,
    required this.description,
    required this.tags,
  });

  factory NewTask.fromJson(Map<String, dynamic> json) =>
      _$NewTaskFromJson(json);

  Map<String, dynamic> toJson() => _$NewTaskToJson(this);
}
