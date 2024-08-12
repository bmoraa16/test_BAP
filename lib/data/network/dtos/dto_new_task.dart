// ignore_for_file: sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'dto_new_task.g.dart';

@JsonSerializable()
class DtoNewTask {
  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'is_completed')
  final int isCompleted;

  @JsonKey(name: 'due_date')
  final String dueDate;

  @JsonKey(name: 'comments')
  final String comments;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'tags')
  final String tags;

  DtoNewTask({
    required this.title,
    required this.isCompleted,
    required this.dueDate,
    required this.comments,
    required this.description,
    required this.tags,
  });

  factory DtoNewTask.fromJson(Map<String, dynamic> json) =>
      _$DtoNewTaskFromJson(json);

  Map<String, dynamic> toJson() => _$DtoNewTaskToJson(this);
}
