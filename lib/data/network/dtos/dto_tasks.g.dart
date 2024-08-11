// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_tasks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoTasks _$DtoTasksFromJson(Map<String, dynamic> json) => DtoTasks(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      isCompleted: (json['is_completed'] as num).toInt(),
      dueDate: json['due_date'] as String,
    );

Map<String, dynamic> _$DtoTasksToJson(DtoTasks instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'is_completed': instance.isCompleted,
      'due_date': instance.dueDate,
    };
