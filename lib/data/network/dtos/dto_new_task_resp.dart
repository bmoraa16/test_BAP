// ignore_for_file: sort_constructors_first

import 'package:json_annotation/json_annotation.dart';
import 'package:test_bap/models/task_str.dart';

part 'dto_new_task_resp.g.dart';

@JsonSerializable()
class DtoNewTaskResp {
  @JsonKey(name: 'detail')
  final String detail;

  @JsonKey(name: 'task')
  final TaskStr task;

  DtoNewTaskResp({
    required this.detail,
    required this.task,
  });

  factory DtoNewTaskResp.fromJson(Map<String, dynamic> json) =>
      _$DtoNewTaskRespFromJson(json);

  Map<String, dynamic> toJson() => _$DtoNewTaskRespToJson(this);
}
