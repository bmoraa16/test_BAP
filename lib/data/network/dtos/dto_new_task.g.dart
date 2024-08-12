// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_new_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoNewTask _$DtoNewTaskFromJson(Map<String, dynamic> json) => DtoNewTask(
      title: json['title'] as String,
      isCompleted: (json['is_completed'] as num).toInt(),
      dueDate: json['due_date'] as String,
      comments: json['comments'] as String,
      description: json['description'] as String,
      tags: json['tags'] as String,
    );

Map<String, dynamic> _$DtoNewTaskToJson(DtoNewTask instance) =>
    <String, dynamic>{
      'title': instance.title,
      'is_completed': instance.isCompleted,
      'due_date': instance.dueDate,
      'comments': instance.comments,
      'description': instance.description,
      'tags': instance.tags,
    };
