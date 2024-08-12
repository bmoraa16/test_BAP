// ignore_for_file: sort_constructors_first

import 'package:json_annotation/json_annotation.dart';
import 'package:test_bap/models/task_str.dart';

part 'json_gen/new_task_resp.g.dart';

@JsonSerializable()
class NewTaskResp {
  String detail;
  TaskStr task;

  NewTaskResp({
    required this.detail,
    required this.task,
  });

  factory NewTaskResp.fromJson(Map<String, dynamic> json) =>
      _$NewTaskRespFromJson(json);

  Map<String, dynamic> toJson() => _$NewTaskRespToJson(this);
}
