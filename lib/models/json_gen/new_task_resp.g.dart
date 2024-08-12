// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../new_task_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewTaskResp _$NewTaskRespFromJson(Map<String, dynamic> json) => NewTaskResp(
      detail: json['detail'] as String,
      task: TaskStr.fromJson(json['task'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewTaskRespToJson(NewTaskResp instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'task': instance.task,
    };
