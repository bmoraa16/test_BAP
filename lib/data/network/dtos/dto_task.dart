// ignore_for_file: sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'dto_task.g.dart';

@JsonSerializable()
class DtoTask {
  @JsonKey(name: 'id')
  final int id;

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

  @JsonKey(name: 'token')
  final String token;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  DtoTask({
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

  factory DtoTask.fromJson(Map<String, dynamic> json) =>
      _$DtoTaskFromJson(json);

  Map<String, dynamic> toJson() => _$DtoTaskToJson(this);
}
