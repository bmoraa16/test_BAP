// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../task_str.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskStr _$TaskStrFromJson(Map<String, dynamic> json) => TaskStr(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      isCompleted: json['is_completed'] as String,
      dueDate: json['due_date'] as String,
      comments: json['comments'] as String,
      description: json['description'] as String,
      tags: json['tags'] as String,
      token: json['token'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$TaskStrToJson(TaskStr instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'is_completed': instance.isCompleted,
      'due_date': instance.dueDate,
      'comments': instance.comments,
      'description': instance.description,
      'tags': instance.tags,
      'token': instance.token,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
