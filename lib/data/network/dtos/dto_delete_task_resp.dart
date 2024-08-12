// ignore_for_file: sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'dto_delete_task_resp.g.dart';

@JsonSerializable()
class DtoDeleteTaskResp {
  @JsonKey(name: 'detail')
  final String detail;

  DtoDeleteTaskResp({
    required this.detail,
  });

  factory DtoDeleteTaskResp.fromJson(Map<String, dynamic> json) =>
      _$DtoDeleteTaskRespFromJson(json);

  Map<String, dynamic> toJson() => _$DtoDeleteTaskRespToJson(this);
}
