// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../tasks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tasks _$TasksFromJson(Map<String, dynamic> json) => Tasks(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as String,
      dueDate: json['dueDate'] as String,
    );

Map<String, dynamic> _$TasksToJson(Tasks instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isCompleted': instance.isCompleted,
      'dueDate': instance.dueDate,
    };
