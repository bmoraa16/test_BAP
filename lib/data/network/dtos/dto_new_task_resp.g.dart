// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_new_task_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoNewTaskResp _$DtoNewTaskRespFromJson(Map<String, dynamic> json) =>
    DtoNewTaskResp(
      detail: json['detail'] as String,
      task: TaskStr.fromJson(json['task'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DtoNewTaskRespToJson(DtoNewTaskResp instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'task': instance.task,
    };
