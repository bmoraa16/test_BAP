// ignore_for_file: sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'dto_tasks.g.dart';

@JsonSerializable()
class DtoTasks {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'is_completed')
  final int isCompleted;

  @JsonKey(name: 'due_date')
  final String dueDate;

  DtoTasks({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.dueDate,
  });

  factory DtoTasks.fromJson(Map<String, dynamic> json) =>
      _$DtoTasksFromJson(json);

  Map<String, dynamic> toJson() => _$DtoTasksToJson(this);
}
