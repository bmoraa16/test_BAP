// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../new_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewTask _$NewTaskFromJson(Map<String, dynamic> json) => NewTask(
      title: json['title'] as String,
      isCompleted: (json['isCompleted'] as num).toInt(),
      dueDate: json['dueDate'] as String,
      comments: json['comments'] as String,
      description: json['description'] as String,
      tags: json['tags'] as String,
    );

Map<String, dynamic> _$NewTaskToJson(NewTask instance) => <String, dynamic>{
      'title': instance.title,
      'isCompleted': instance.isCompleted,
      'dueDate': instance.dueDate,
      'comments': instance.comments,
      'description': instance.description,
      'tags': instance.tags,
    };
