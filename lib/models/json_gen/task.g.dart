// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      isCompleted: (json['isCompleted'] as num).toInt(),
      dueDate: json['dueDate'] as String,
      comments: json['comments'] as String,
      description: json['description'] as String,
      tags: json['tags'] as String,
      token: json['token'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isCompleted': instance.isCompleted,
      'dueDate': instance.dueDate,
      'comments': instance.comments,
      'description': instance.description,
      'tags': instance.tags,
      'token': instance.token,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
