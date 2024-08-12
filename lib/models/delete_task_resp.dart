// ignore_for_file: sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'json_gen/delete_task_resp.g.dart';

@JsonSerializable()
class DeleteTaskResp {
  String detail;

  DeleteTaskResp({
    required this.detail,
  });

  factory DeleteTaskResp.fromJson(Map<String, dynamic> json) =>
      _$DeleteTaskRespFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteTaskRespToJson(this);
}
