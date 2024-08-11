// ignore_for_file: sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'json_gen/tasks.g.dart';

//cambiar el TasksURL por los datos de los detalles de la lista

@JsonSerializable()
class Tasks {
  int id;
  String title;
  String isCompleted;
  String dueDate;

  Tasks({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.dueDate,
  });

  factory Tasks.fromJson(Map<String, dynamic> json) => _$TasksFromJson(json);

  Map<String, dynamic> toJson() => _$TasksToJson(this);
}
