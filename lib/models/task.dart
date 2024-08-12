// ignore_for_file: sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'json_gen/task.g.dart';

@JsonSerializable()
class Task {
  int id;
  String title;
  int isCompleted;
  String dueDate;
  String comments;
  String description;
  String tags;
  String token;
  String createdAt;
  String updatedAt;

  Task({
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

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
