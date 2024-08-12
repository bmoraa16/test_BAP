// ignore_for_file: sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'json_gen/task_str.g.dart';

@JsonSerializable()
class TaskStr {
  int id;
  String title;
  String isCompleted;
  String dueDate;
  String comments;
  String description;
  String tags;
  String token;
  String createdAt;
  String updatedAt;

  TaskStr({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.dueDate,
    required this.comments,
    required this.description,
    required this.tags,
    required this.token,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TaskStr.fromJson(Map<String, dynamic> json) =>
      _$TaskStrFromJson(json);

  Map<String, dynamic> toJson() => _$TaskStrToJson(this);
}
